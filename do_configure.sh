#!/bin/bash

# Since meson does not support changing options from the meson.build file,
# this require to configure them before. It is also possible to change them
# with default_options but in that case 'wipe refresh' for the build directory is required.

readonly build_dir="build"
declare conf_list

function do_configure_debug()
{
    conf_list=(
        "-Dbuildtype=debugoptimized"
    )

    check_examples_build
}

function do_configure_release()
{
    conf_list=(
        "-Dbuildtype=release"
        "-Doptimization=3"
    )

    check_examples_build
}

function check_examples_build()
{
    echo "Should be examples build also? [y/n]"
    read opt

    if [[ ${opt} =~ ^[y|Y]$ ]];
    then
        conf_list+=" -Dauto_build_examples=true"
    else
        conf_list+=" -Dauto_build_examples=false"
    fi
}

function main()
{
    case ${1} in
        "debug")
            do_configure_debug
            ;;
        "release")
            do_configure_release
            ;;
        *)
            echo -e "Bad use. Try '$0 [debug|release]'."
            exit 1
            ;;
    esac

    meson configure ${conf_list[@]} ${build_dir}
    echo -e "Overrided options:\n${conf_list[@]}"
}

main ${@}
exit 0
