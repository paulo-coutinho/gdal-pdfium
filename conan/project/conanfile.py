from conans import ConanFile, CMake


class TargetConan(ConanFile):
    name = "ios"
    version = "1.0.0"
    settings = "os", "compiler", "build_type", "arch"
    options = {
        "shared": [True, False],
        "fPIC": [True, False],
        "project_config_target": "ANY",
        "project_config_arch": "ANY",        
        "project_config_pdfium": "ANY",        
    }
    default_options = {
        "shared": False,
        "fPIC": True, 
        "project_config_target": "ezored",
        "project_config_arch": "ANY",
        "project_config_pdfium": "ANY",
    }
    exports_sources = "*"
    generators = "cmake"

    def build(self):
        if self.settings.os in ["iOS"]:
            cmake = CMake(self)
        else:
            cmake = CMake(self)

        cmake.definitions["CMAKE_BUILD_TYPE"] = self.settings.build_type
        cmake.definitions["PROJECT_CONFIG_TARGET"] = self.options.get_safe("project_config_target")
        cmake.definitions["PROJECT_CONFIG_ARCH"] = self.options.get_safe("project_config_arch")
        cmake.definitions["PROJECT_CONFIG_PDFIUM"] = self.options.get_safe("project_config_pdfium")
        cmake.configure()
        cmake.build()

    def configure(self):
        self.options["gdal"].with_pdfium = self.options.project_config_pdfium

    def requirements(self):
        self.requires("gdal/3.3.1")
