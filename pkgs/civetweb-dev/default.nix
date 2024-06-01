{ stdenv, civetweb, pkgs }:

civetweb.overrideAttrs (oldAttrs: {
    pname = "civetweb-dev";
    cmakeFlags = [
      "-DBUILD_SHARED_LIBS=OFF"
      "-DBUILD_STATIC_LIBS=ON"
      "-DCIVETWEB_ENABLE_CXX=OFF"
      "-DCIVETWEB_ENABLE_IPV6=OFF"
      "-DCIVETWEB_ENABLE_SERVER_EXECUTABLE=OFF"
      "-DCIVETWEB_ENABLE_SSL=OFF"
      # The civetweb unit tests rely on downloading their fork of libcheck.
      "-DCIVETWEB_BUILD_TESTING=OFF"
    ];

    patches = [ ./mingw-cross.patch ];
})
