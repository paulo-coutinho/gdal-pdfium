"""Module: Pack"""

import os
import tarfile
import zipfile

# -----------------------------------------------------------------------------
def unpack(src_path, dst_path, filename=""):
    dst_path = dst_path + ("" if len(filename) == 0 else "/" + filename)

    if ".zip" in src_path:
        with zipfile.open(src_path, "r") as archive:
            def is_within_directory(directory, target):
                
                abs_directory = os.path.abspath(directory)
                abs_target = os.path.abspath(target)
            
                prefix = os.path.commonprefix([abs_directory, abs_target])
                
                return prefix == abs_directory
            
            def safe_extract(tar, path=".", members=None, *, numeric_owner=False):
            
                for member in tar.getmembers():
                    member_path = os.path.join(path, member.name)
                    if not is_within_directory(path, member_path):
                        raise Exception("Attempted Path Traversal in Tar File")
            
                tar.extractall(path, members, numeric_owner=numeric_owner) 
                
            
            safe_extract(archive, dst_path)
            archive.close()
    elif ".tgz" or ".bz2" or ".tar.gz" or "tbz2" or ".tar.bz2" or ".tar" in src_path:
        with tarfile.open(src_path, "r:*") as archive:
            def is_within_directory(directory, target):
                
                abs_directory = os.path.abspath(directory)
                abs_target = os.path.abspath(target)
            
                prefix = os.path.commonprefix([abs_directory, abs_target])
                
                return prefix == abs_directory
            
            def safe_extract(tar, path=".", members=None, *, numeric_owner=False):
            
                for member in tar.getmembers():
                    member_path = os.path.join(path, member.name)
                    if not is_within_directory(path, member_path):
                        raise Exception("Attempted Path Traversal in Tar File")
            
                tar.extractall(path, members, numeric_owner=numeric_owner) 
                
            
            safe_extract(archive, dst_path)
            archive.close()
    else:
        raise Exception("File format not supported")


# -----------------------------------------------------------------------------
def zip_dir(output_filename, source_dir):
    exclude_list = ["Thumbs.db", ".DS_Store"]

    zip_out = zipfile.ZipFile(output_filename, "w", compression=zipfile.ZIP_DEFLATED)
    root_len = len(os.path.dirname(source_dir))

    def archive_directory(parent_directory):
        contents = os.listdir(parent_directory)

        if not contents:
            archive_root = parent_directory[root_len:].replace("\\", "/").lstrip("/")
            zip_info = zipfile.ZipInfo(archive_root + "/")
            zip_out.writestr(zip_info, "")

        for item in contents:
            if item in exclude_list:
                continue

            full_path = os.path.join(parent_directory, item)

            if os.path.isdir(full_path) and not os.path.islink(full_path):
                archive_directory(full_path)
            else:
                archive_root = full_path[root_len:].replace("\\", "/").lstrip("/")

                if os.path.islink(full_path):
                    zip_info = zipfile.ZipInfo(archive_root)
                    zip_info.create_system = 3
                    zip_info.external_attr = 0xA1ED0000
                    zip_out.writestr(zip_info, os.readlink(full_path))
                else:
                    zip_out.write(full_path, archive_root, zipfile.ZIP_DEFLATED)

    archive_directory(source_dir)

    zip_out.close()


# -----------------------------------------------------------------------------
def tar_dir(output_filename, source_dir):
    exclude_list = ["Thumbs.db", ".DS_Store"]

    tar_out = tarfile.open(output_filename, "w:gz")
    tar_out.add(
        source_dir,
        arcname=os.path.basename(source_dir),
        filter=lambda x: None if x.name in exclude_list else x,
    )
    tar_out.close()


# -----------------------------------------------------------------------------
def tar_files(output_filename, source_files):
    exclude_list = ["Thumbs.db", ".DS_Store"]

    tar_out = tarfile.open(output_filename, "w:gz")

    for source_file in source_files:
        tar_out.add(
            source_file["path"],
            arcname=source_file["arcname"],
            filter=lambda x: None if x.name in exclude_list else x,
        )

    tar_out.close()
