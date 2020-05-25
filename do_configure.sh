#!/bin/bash

# Since meson does not support changing options from the meson.build file,
# this require to configure them before. It is also possible to change them
# with default_options but in that case 'wipe refresh' for the build directory is required.

source auto_conf

readonly build_dir="build"
declare conf_list

#
# Build types
#

function do_configure_debug()
{
    conf_list=(
        "-Dbuildtype=debugoptimized"
    )
}

function do_configure_release()
{
    conf_list=(
        "-Dbuildtype=release"
        "-Doptimization=3"
    )
}

#
# Utils
#

function check_examples_build()
{
    local val="false"

    if [ -n "$auto_build_examples" ]; then
        [ "$auto_build_examples" == "1" ] && val="true"
    else
        get_user_choice && val="true"
    fi

    conf_list+=" -Dauto_build_examples=${val}"
}

function get_user_choice()
{
    local opt

    echo "Should be examples build also? [y/n]"
    read opt

    [[ ${opt} =~ ^[y|Y]$ ]] && return 0 || return 1
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

    # opts
    check_examples_build

    meson configure ${conf_list[@]} ${build_dir}
    echo -e "Overrided options:\n${conf_list[@]}"
}

main ${@}
exit 0
