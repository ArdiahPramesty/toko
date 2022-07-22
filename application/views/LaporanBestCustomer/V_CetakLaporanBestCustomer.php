<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Laporan Rekapitulasi Best Seller</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    
    <img src="<?php echo base_url('Assets/assets/images/toko/KopSurat.jpg') ?>" style="width:40%"><br>

    <h2 style="text-align:center;">Laporan Rekapitulasi Data Product Best Customer (Customer Dengan Order Terbanyak)</h2>
    <h6 style="margin-bottom:2px; font-size:12pt">Periode Bulan :
        <?php 
            if ($bulan == '01') {
                echo 'JANUARI';
            } else if ($bulan == '02') {
                echo 'FEBRUARI';
            } else if ($bulan == '03') {
                echo 'MARET';
            } else if ($bulan == '04') {
                echo 'APRIL';
            } else if ($bulan == '05') {
                echo 'MEI';
            } else if ($bulan == '06') {
                echo 'JUNI';
            } else if ($bulan == '07') {
                echo 'JULI';
            } else if ($bulan == '08') {
                echo 'AGUSTUS';
            } else if ($bulan == '09') {
                echo 'SEPTEMBER';
            } else if ($bulan == '10') {
                echo 'OKTOBER';
            } else if ($bulan == '11') {
                echo 'NOVEMBER';
            } else if ($bulan == '12') {
                echo 'DESEMBER';
            }
        ?> <?php echo $tahun; ?>
    </h6>
    <p style="font-size:12pt;">Tanggal Cetak : <?php echo date("D, d M Y"); ?></p><br>

    <table style="border: 2px solid black; border-collapse: collapse; font-size:10pt;">
        <thead>
            <tr>
                <th style="text-align:center; border: 1px solid black;">No</th>
                <th style="text-align:center; border: 1px solid black;">ID Customer</th>
                <th style="text-align:center; border: 1px solid black;">Nama Customer</th>
                <th style="text-align:center; border: 1px solid black;">Jumlah Order</th>
                <th style="text-align:center; border: 1px solid black;">Total Pemasaukan</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $no=1;
                foreach ($bestCustomerOrderMonth as $data) {
            ?>
            <tr>
                <td style="text-align:center; border: solid 1px black; width:5%"><?php echo $no++ ?></td>
                <td style="text-align:center; border: solid 1px black; width:20%"><?php echo $data->id_customer ?></td>
                <td style="text-align:center; border: solid 1px black; width:25%"><?php echo $data->nm_customer ?></td>
                <td style="text-align:center; border: solid 1px black; width:20%"><?php echo $data->data_order ?></td>
                <td style="text-align:center; border: solid 1px black; width:20%">Rp.<?php echo $data->data_subtotal ?></td>
            </tr>
            <?php
                }
            ?>
            <!--<tr>
                <td colspan="9"  style="text-align:center; border: solid 1px black; font-size:12pt; font-weight:bold;"> GRAND TOTAL</td>
                <?php foreach($GTMonth as $data) { ?>
                <td style="text-align:center; border: solid 1px black; font-size:12pt; font-weight:bold;"><?php echo $data->data_grandtotal ?></td>
                <?php } ?>
            </tr>-->
            
        </tbody>
    </table><br>
</body>
</html>