;Openshift Server
okd4-bootstrap.lab.labor.lan.   IN A 172.16.16.40
okd4-master1.lab.labor.lan.     IN A 172.16.16.41
okd4-master2.lab.labor.lan.     IN A 172.16.16.42
okd4-master3.lab.labor.lan.     IN A 172.16.16.43
okd4-worker1.lab.labor.lan.     IN A 172.16.16.44
okd4-worker2.lab.labor.lan.     IN A 172.16.16.45
okd4-services.labor.lan.        IN A 172.16.16.50
okd4-pfsense.labor.lan.         IN A 172.16.16.1

;Openshift internal stuff
api.lab.labor.lan.       IN    A    172.16.16.50
api-int.lab.labor.lan.   IN    A    172.16.16.50
*.apps.lab.labor.lan.    IN    A    172.16.16.50
etcd-0.lab.labor.lan.    IN    A    172.16.16.41
etcd-1.lab.labor.lan.    IN    A    172.16.16.42
etcd-2.lab.labor.lan.    IN    A    172.16.16.43
console-openshift-console.apps.lab.labor.lan.     IN     A 172.16.16.50
oauth-openshift.apps.lab.labor.lan.               IN     A 172.16.16.50

;Openshift internal srv
_etcd-server-ssl._tcp.lab.labor.lan.    86400     IN    SRV     0    10    2380    etcd-0.lab.
_etcd-server-ssl._tcp.lab.labor.lan.    86400     IN    SRV     0    10    2380    etcd-1.lab.
_etcd-server-ssl._tcp.lab.labor.lan.    86400     IN    SRV     0    10    2380    etcd-2.lab.


08:00:27:9a:c7:b9	172.16.16.40	okd4-bootstrap		 
08:00:27:67:d3:98	172.16.16.41	okd4-master1		 
08:00:27:7c:b1:57	172.16.16.42	okd4-master2		 
08:00:27:15:e1:e7	172.16.16.43	okd4-master3		 
08:00:27:36:5b:fd	172.16.16.44	okd4-worker1		 
08:00:27:37:77:49	172.16.16.45	okd4-worker2
08:00:27:40:74:a7	172.16.16.50	okd4-services



Create ISO set corect liveiso name!!:
isolinux.cfg aus iso corefs

label bootstrap
  menu label ^OKD Bootstrap
  menu default
  kernel /images/pxeboot/vmlinuz
  append initrd=/images/pxeboot/initrd.img,/images/ignition.img mitigations=auto,nosmt systemd.unified_cgroup_hierarchy=0 coreos.liveiso=[NEW ISO NAME] ignition.firstboot ignition.platform.id=metal coreos.inst=yes coreos.inst.install_dev=/dev/sda coreos.inst.image_url=http://192.168.56.150:8080/okd4/fcos.raw.xz coreos.inst.ignition_url=http://192.168.56.150:8080/okd4/bootstrap.ign




label linux
  menu label ^Fedora CoreOS (Live)
  menu default
  kernel /images/pxeboot/vmlinuz
  append initrd=/images/pxeboot/initrd.img,/images/ignition.img mitigations=auto,nosmt systemd.unified_cgroup_hierarchy=0 coreos.liveiso=fcos32m ignition.firstboot ignition.platform.id=metal

label bootstrap
  menu label ^OKD Bootstrap
  menu default
  kernel /images/pxeboot/vmlinuz
  append initrd=/images/pxeboot/initrd.img,/images/ignition.img mitigations=auto,nosmt systemd.unified_cgroup_hierarchy=0 coreos.liveiso=fcos32m ignition.firstboot ignition.platform.id=metal coreos.inst.install_dev=/dev/sda coreos.inst.image_url=http://192.168.56.150:8080/okd4/fcos.raw.xz coreos.inst.ignition_url=http://192.168.56.150:8080/okd4/bootstrap.ign

label master
  menu label ^OKD Master
  menu default
  kernel /images/pxeboot/vmlinuz
  append initrd=/images/pxeboot/initrd.img,/images/ignition.img mitigations=auto,nosmt systemd.unified_cgroup_hierarchy=0 coreos.liveiso=fcos32m ignition.firstboot ignition.platform.id=metal coreos.inst.install_dev=/dev/sda coreos.inst.image_url=http://192.168.56.150:8080/okd4/fcos.raw.xz coreos.inst.ignition_url=http://192.168.56.150:8080/okd4/master.ign

label worker
  menu label ^OKD Worker
  menu default
  kernel /images/pxeboot/vmlinuz
  append initrd=/images/pxeboot/initrd.img,/images/ignition.img mitigations=auto,nosmt systemd.unified_cgroup_hierarchy=0 coreos.liveiso=fcos32m ignition.firstboot ignition.platform.id=metal coreos.inst.install_dev=/dev/sda coreos.inst.image_url=http://192.168.56.150:8080/okd4/fcos.raw.xz coreos.inst.ignition_url=http://192.168.56.150:8080/okd4/worker.ign




  in iso dir
  mkisofs -o fcos.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -V "FCOSISO" -boot-load-size 4 -boot-info-table -R -J -v -T .

this on:
mkisofs -U -A fcos32m -V fcos32m -volset fcos-32m -J -joliet-long -r -v -T -x ./lost+found -o fcos32m.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot .


# mkisofs -J -T -o /tmp/rhel73_custom.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -R -graft-points -V "RHEL-7.3 custom.x86_64" -eltorito-alt-boot -eltorito-boot images/efiboot.img -no-emul-boot /mnt/rhel73new/

mkisofs -o kickstart7.5.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -R -J -V "RHEL-7.5 Server.x86_64" -T .


mkisofs -o fcos-custom.iso -b isolinux.bin -c boot.cat -no-emul-boot -V "fcos-custom" -boot-load-size 4 -boot-info-table -R -J -v -T .
isohybrid fcos-custom.iso
implantisomd5 fcos-custom.iso

https://github.com/coreos/fedora-coreos-tracker/issues/555
https://builds.coreos.fedoraproject.org/browser?stream=stable

sudo chmod -R 755 /var/www/html/
sudo chown -R apache: /var/www/html/

chmod -R 755 /var/www/html/ && chown -R apache: /var/www/html/

ssh core@bootstrap ! to view log

https://docs.okd.io/latest/support/troubleshooting/troubleshooting-installations.html