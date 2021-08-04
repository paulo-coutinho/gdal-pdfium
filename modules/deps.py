import os
import subprocess
import re

import modules.file as file
import modules.log as log
import modules.config as config
import modules.net as net
import modules.pack as pack


# -----------------------------------------------------------------------------
def get_gdal(root_dir, target_name):
    build_dir = os.path.join(root_dir, "build", target_name)
    dest_file = os.path.join(
        build_dir,
        "gdal-{0}.tar.gz".format(
            config.gdal_version,
        ),
    )
    unpacked_dir = os.path.join(
        build_dir,
        "gdal-{0}".format(
            config.gdal_version,
        ),
    )

    # download
    if file.file_exists(dest_file):
        log.info("GDAL already download")
    else:
        url = "https://github.com/OSGeo/gdal/releases/download/v{0}/gdal-{0}.tar.gz".format(
            config.gdal_version,
            config.gdal_version,
        )
        log.info("Downloading GDAL from URL {0}...".format(url))
        net.download(url, dest_file)
        log.ok()

    # extract
    if file.dir_exists(unpacked_dir):
        log.info("GDAL already unpacked")
    else:
        log.info("Unpacking GDAL...")
        pack.unpack(dest_file, build_dir)
        log.ok()


# -----------------------------------------------------------------------------
def get_pdfium(prefix):
    log.info("Downloading PDFium...")

    root_dir = file.root_dir()
    build_dir = os.path.join(root_dir, "build")
    pdfium_dir = os.path.join(build_dir, "pdfium")
    pdfium_file = os.path.join(build_dir, "{0}.tgz".format(prefix))
    pdfium_url = "https://github.com/paulo-coutinho/pdfium-lib/releases/download/4584-gdal/{0}.tgz".format(
        prefix
    )

    file.create_dir(build_dir)

    if file.file_exists(pdfium_file):
        log.info("PDFium file already downloaded")
    else:
        net.download(pdfium_url, pdfium_file)
        log.info("PDFium downloaded")

    # extract
    if file.dir_exists(pdfium_dir):
        log.info("PDFium already unpacked")
    else:
        log.info("Unpacking PDFium...")
        pack.unpack(pdfium_file, pdfium_dir)
        log.ok()


# -----------------------------------------------------------------------------
def get_conan_dep_dir(name, version, conan_arch, conan_os):
    run_args = [
        "conan",
        "search",
        "{0}/{1}@".format(name, version),
        "-q",
        "(arch={0}) AND (os={1})".format(conan_arch, conan_os),
    ]

    result = subprocess.run(run_args, stdout=subprocess.PIPE)
    output = result.stdout.decode()

    package_data = re.findall("(Package_ID:\s)(\w*)", output)
    package_id = package_data[0][1]

    package_dir = os.path.join(
        file.home_dir(),
        ".conan",
        "data",
        name,
        version,
        "_",
        "_",
        "package",
        package_id,
    )

    return package_dir
