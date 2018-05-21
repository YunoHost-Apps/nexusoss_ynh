#=================================================
# SET ALL CONSTANTS
#=================================================

app=$YNH_APP_INSTANCE_NAME
appuser=nexus
final_path="/var/lib/$app"
NEXUS_VERSION=3.11.0-01

# Define app's data directory
APPDIR="${final_path}/nexus-$NEXUS_VERSION"
DATADIR="${final_path}/sonatype-work"

# Detect the system architecture to download the right tarball
# NOTE: `uname -m` is more accurate and universal than `arch`
# See https://en.wikipedia.org/wiki/Uname
if [ -n "$(uname -m | grep 64)" ]; then
	architecture="x86-64"
elif [ -n "$(uname -m | grep 86)" ]; then
	architecture="i386"
elif [ -n "$(uname -m | grep arm)" ]; then
	architecture="arm"
else
	ynh_die "Unable to detect your achitecture, please open a bug describing \
        your hardware and the result of the command \"uname -m\"." 1
fi

#=================================================
# DEFINE ALL COMMON FONCTIONS
#=================================================

create_dir() {
    mkdir -p "$final_path/data"
    mkdir -p "$final_path/custom/conf"
    mkdir -p "$REPO_PATH"
    mkdir -p "$DATA_PATH/avatars"
    mkdir -p "$DATA_PATH/attachments"
    mkdir -p "/var/log/$app"
}

config_nginx() {
    if [ "$path_url" != "/" ]
    then
        ynh_replace_string "^#sub_path_only" "" "../conf/nginx.conf"
    fi
    ynh_add_nginx_config
}

set_permission() {
    chown -R $app:$app "$final_path"
    chown -R $app:$app "/home/$app"
    chown -R $app:$app "/var/log/$app"
    chmod u=rwX,g=rX,o= "$final_path"
    chmod u=rwX,g=rX,o= "/home/$app"
    chmod u=rwX,g=rX,o= "/var/log/$app"
}