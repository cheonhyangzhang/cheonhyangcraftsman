# How to setup user access with Digital Ocean
When creating a droplet in digital ocean, user can specify a SSH key. This key will be added to /root/.ssh/authorized_keys.
This means when ssh using the corresponding private key, user is able to login as root, no password needed.

Usually it's good to setup addition users and not use root account.
This is possible to be done by running `useradd <user_name>`. Password can be set using `passwd <user_name>`.
Probably also want to add at least one new user to sudoers, `usermod -aG wheel <user_name>``
After sucessfully added, can user the user and run `sudo whoami` to verify if successful.
However, after this setup, user won't be able to use this new user due to the missing ssh key setup.

We need to copy the public key to /home/<user_name>/.ssh/authorized_keys in order to access using the newly created account.
