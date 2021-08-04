from conans import ConanFile

required_conan_version = ">=1.33.0"


class GdalConan(ConanFile):
    name = "gdal"
    generators = "pkg_config"
    version = "3.3.1"
    settings = "os", "arch", "compiler", "build_type"
    options = {
        "shared": [True, False],
        "fPIC": [True, False],
    }
    default_options = {
        "shared": False,
        "fPIC": True,
    }

    def config_options(self):
        if self.settings.os == "Windows":
            del self.options.fPIC

    def configure(self):
        if self.options.shared:
            del self.options.fPIC

    def requirements(self):
        self.requires("m4/1.4.18")
