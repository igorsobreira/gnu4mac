function download_and_install {
    local url=$1
    local package_name=$(basename ${url})

    (
        cd ${TMP_DIR}
        curl -O ${URL}
        rm -rf tmppackage && mkdir -p tmppackage
        tar xzf ${package_name} -C tmppackage
        cd tmppackage/$(ls tmppackage)
        ./configure --prefix=${INSTALL_PREFIX} && make && make install
    )
    rm -rf ${TMP_DIR}/{${package_name},tmppackage}
}