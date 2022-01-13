
#!/bin/sh
zenity=$(zenity --width=800 --height=450 --list\
   --title="Komutlar"\
   --text="Listeden komut seçiniz"\
   --radiolist\
   --column="Select"\
   --column="Komutlar"\
   --column="Açıklama"\
   FALSE "lscpu" "İşlemci ve işlem birimleri hakkında bilgi verir."\
   FALSE "lspci" "Tüm pci veriyollarını ve bunlara bağlı cihszlarla ilgili ayrıntıları listeler."\
   FALSE "lsblk" "Sabit sürücüleriniz,flash sürücüleriniz ve bunların bölümleri gibi ayrıntılı blok aygıtı bilgilerinin getirir."\
   FALSE "lsusb" "USB denetleyicileri ve bunlara bağlı aygıtlarla ilgili ayrıntıları gösterir."\
   FALSE "hdparm" "Sabit diskler gibi sata cihazları hakkında bilgi alır."\
   FALSE "df-H" "Çeşitli bölümleri,bunların bağlantı noktalarını ve her birinde kullanılan ve kullanılabilir alanı raporlar."\
   FALSE "uname-m" "Makinenizin donanım adını yazdırır."\
   FALSE "uname-a" "Makinenizin tüm bilgilerini yazdırır."\
   FALSE "mount|column-t" "Takılı dosya sistemlerinin bağını kaldırmak ve görüntülemek için kullanılır." \
   FALSE "cat /proc/cpuinfo" "proc dizinindeki sanal dosyaların cpu bilgisi."\
   FALSE "cat /proc/version" "proc dizinindeki sanal dosyaların sürüm bilgisi."\
   FALSE "cat /proc/scsi/scsi" "proc dizinindeki sanal dosyaların sata cihazları hakkındaki bilgisi."\
   FALSE "cat /proc/partitions" "proc dizinindeki sanal dosyaların bölümleri.")

if [[ $zenity == "lscpu" ]]; then
  bash lscpu.sh
elif [[ $zenity == "lspci" ]]; then
  bash lspci.sh
elif [[ $zenity == "lsblk" ]]; then
  bash lsblk.sh
elif [[ $zenity == "lsusb" ]]; then
  bash lsusb.sh
elif [[ $zenity == "hdparm" ]]; then
  bash hdparm.sh
elif [[ $zenity == "df-H" ]]; then
  bash df-H.sh
elif [[ $zenity == "uname-m" ]]; then
  bash uname_m.sh
elif [[ $zenity == "uname-a" ]]; then
  bash uname_a.sh
elif [[ $zenity == "mount|column-t" ]]; then
  bash mount_column_t.sh
elif [[ $zenity == "cat /proc/cpuinfo" ]]; then
  bash cat_proc_cpuinfo.sh
elif [[ $zenity == "cat /proc/version" ]]; then
  bash cat_proc_version.sh
elif [[ $zenity == "cat /proc/scsi/scsi" ]]; then
  bash cat_proc_scsi_scsi.sh
elif [[ $zenity == "cat /proc/partitions" ]]; then
  bash cat_proc_partitions.sh
fi

FILE=`dirname $0`/komut.txt
zenity --width=600 --height=600 --text-info\
     --title=$zenity\
     --filename=$FILE

case $? in
   0)
    bash linux.sh;;
   1)
     echo "";;
   -1)
     echo "";;
esac
