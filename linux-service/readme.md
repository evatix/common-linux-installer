# Linux Service Example

## Links

- [Service Create](https://www.linode.com/docs/quick-answers/linux/start-service-at-boot)
- [How do I make my systemd service run via specific user and start on boot? - Ask Ubuntu](https://askubuntu.com/questions/676007/how-do-i-make-my-systemd-service-run-via-specific-user-and-start-on-boot)

## Commands

```bash
sudo cp akarim-service.service /etc/systemd/system/akarim-service.service
sudo chmod 644 /etc/systemd/system/akarim-service.service
sudo systemctl start akarim-service.service
sudo systemctl status akarim-service.service
sudo systemctl restart akarim-service.service
sudo systemctl enable akarim-service.service
sudo systemctl status akarim-service.service

```