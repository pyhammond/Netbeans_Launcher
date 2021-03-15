#!/bin/zsh
##############################################################################
##     Configurable Variables                                               ##
##############################################################################
# change this first VPN_CONFIG variable to match the _exact_ name of your VPN connection
VPN_CONFIG="VPN to XMission"

# The path to your NetBeans App
NETBEANS="/Applications/NetBeans/Apache NetBeans 12.3.app"

# The location of where we will store our temporary SSH "Environment" script
SSH_ENV=~/.ssh/environment

# The path to your Java home directory - managed by this built-in script in MacOS
JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`

##############################################################################
##     No more things to configure                                          ##
##############################################################################
PATH=/bin:/usr/bin:/usr/sbin

# this function launches ssh-agent and adds all of your ssh-keys to the agent if it isn't running
# It's a singleton so that you don't have tons of ssh keys running all over the place
function start_ssh_agent {
	# start the ssh-agent up
	ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" >/dev/null

	# cd into the user's .ssh dir and add all of their keys to the agent
	pushd ~/.ssh >/dev/null
	ssh-add -A -K >/dev/null 2>&1
	popd >/dev/null
}

# See if the ssh-agent is running and if not, call the function above to start it
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" >/dev/null
	ps -p ${SSH_AGENT_PID} | tail -1 | grep ssh-agent$ >/dev/null || {
		start_ssh_agent
	}
else
	start_ssh_agent;
fi

# Now, with all of those environment variables set up properly now, we can run NetBeans
open "${NETBEANS}" --env JAVA_HOME="${JAVA_HOME}"

# Lastly, launch VPN if it's not already running
networksetup -showpppoestatus "${VPN_CONFIG}" | grep ^connected >/dev/null || {
	networksetup -connectpppoeservice "${VPN_CONFIG}"
}
