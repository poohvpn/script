if [ "$(id -u)" -ne 0 ];then
echo "need to run with sudo!"
exit
fi

grep -qxF '%wheel ALL=(ALL) NOPASSWD: ALL' /etc/sudoers || echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
cat <<EOF > /etc/polkit-1/rules.d/49-nopasswd_global.rules 
/* Allow members of the wheel group to execute any actions
 * without password authentication, similar to "sudo NOPASSWD:"
 */
polkit.addRule(function(action, subject) {
    if (subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
EOF
