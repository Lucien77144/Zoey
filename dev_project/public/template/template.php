<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#000000" />
    <link rel="manifest" href="manifest.json" />
    <link rel="apple-touch-icon" href="logo192.png" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <meta name="description" content="<?= $metaDesc ?>">


    <!-- <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_old.css"> -->
    <link rel="stylesheet" href="public/css/style_popUpInstall.css">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style.css">
    <!-- <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_header.css">
    <link rel="stylesheet" href="<?= BASE_URL ?>public/css/style_commun.css"> -->

    <?php if (isset($stylesBlock)) echo $stylesBlock ?>

    <script src="vendor/jquery-3.6.0.min.js"></script>
    <title><?= $pageTitle ?></title>
</head>

<body>
    <!-- Header / Footer -->
    <header>
        <h1><a href="index.php">ZOEY</a></h1>
        <!-- <div class="navbar"><a href="index.php?action=messages"><img src="<?= BASE_URL ?>public/images/icons/msg.svg" alt=""></a><a href="index.php?action=addpost"><img src="<?= BASE_URL ?>public/images/icons/upload.svg" alt=""></a></div> -->
        <div class="navbar">
            <a id='iconMessage' href="index.php?action=messages">
                <?php
                if (isset($_SESSION['readstate']) && $_SESSION['readstate'] == 2) {
                ?>
                    <svg width="33" height="34" viewBox="0 0 33 34" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M28.1091 1.18607C28.7912 0.941883 29.5333 0.941884 30.2155 1.18607C31.8899 1.78536 32.7756 3.66967 32.1939 5.39478L23.3592 31.575C23.1991 32.0478 22.9374 32.4773 22.5937 32.8314C22.3083 33.1227 21.9725 33.3565 21.6037 33.5204C19.9724 34.2455 18.0794 33.4708 17.3757 31.7901L12.9103 21.0541L10.5 19.99C11.3273 19.4993 11.7727 19.1875 12.5 18.4747L13.4806 18.9077L28.5803 3.35045L13.5 9C13.1158 8.24816 12.8434 7.81895 12.195 7.13246L28.1091 1.18607ZM19.9747 31.5279C20.5328 31.7277 21.1424 31.4236 21.3365 30.8487L30.0932 4.9092L14.9935 20.4665L19.3424 30.9203C19.4608 31.2055 19.6904 31.4261 19.9747 31.5279Z" fill="#FFA319" />
                        <circle cx="7" cy="13" r="6" fill="#FFC800" />
                    </svg>
                <?php
                } else {
                ?>
                    <svg width="33" height="34" viewBox="0 0 33 34" fill="none">
                        <path d="M30.2155 1.18609C29.5333 0.941907 28.7912 0.941906 28.1091 1.18609L2.70107 10.2909C1.02665 10.89 0.140751 12.7742 0.722236 14.4993C1.01854 15.3783 1.66057 16.088 2.4908 16.4542L12.9103 21.0541L17.3757 31.7901C18.0794 33.4708 19.9724 34.2455 21.6037 33.5204C21.9725 33.3565 22.3083 33.1227 22.5937 32.8314C22.9374 32.4773 23.1991 32.0478 23.3592 31.575L32.1939 5.3948C32.7756 3.66969 31.8899 1.78538 30.2155 1.18609ZM21.3365 30.8487C21.1424 31.4236 20.5328 31.7277 19.9747 31.5279C19.6904 31.4261 19.4608 31.2055 19.3424 30.9203L14.9935 20.4665L30.0932 4.90922L21.3365 30.8487ZM13.4806 18.9077L3.33424 14.427C2.92469 14.2536 2.66597 13.8327 2.68897 13.3772C2.69473 12.9192 2.98319 12.516 3.40609 12.3749L28.5803 3.35047L13.4806 18.9077Z" fill="#FFA319" />
                    </svg>
                <?php
                }
                ?>
            </a>
            <a href="index.php?action=addpost">
                <svg width="34" height="34" viewBox="0 0 34 34" fill="none">
                    <g class="cross">
                        <rect x="15.814" y="7.11627" width="2.37209" height="19.7674" fill="#FFA319" />
                        <rect x="7.11633" y="15.8139" width="19.7674" height="2.37209" fill="#FFA319" />
                    </g>
                    <rect x="1.25" y="1.25" width="31.5" height="31.5" rx="3.75" stroke="#FFA319" stroke-width="2.5" />
                </svg>
            </a>
        </div>
    </header>
    <nav class="menu">
        <div class="menuInner">
            <a href="index.php?action=blog">
                <svg viewBox="0 0 35 33" fill="none">
                    <path d="M0 28.1695V0.758336C0.242448 0.277086 0.591534 -0.000909224 1.17122 2.23429e-06C9.11732 0.00911682 17.0637 0.0112442 25.0104 0.00638311C25.7815 0.00638311 26.1807 0.411071 26.1816 1.19128C26.1816 3.03607 26.1816 4.88056 26.1816 6.72474V7.11576H26.5881C28.9333 7.11576 31.2794 7.13034 33.6237 7.10573C34.2617 7.09935 34.7284 7.27526 35 7.86771V28.1695C34.9735 28.2284 34.9519 28.2894 34.9353 28.3518C34.7469 29.5562 34.1343 30.6535 33.2081 31.4461C32.2819 32.2386 31.103 32.674 29.884 32.674C21.628 32.6819 13.3723 32.6819 5.11693 32.674C3.98577 32.6728 2.88681 32.2972 1.99151 31.6059C1.09621 30.9145 0.454928 29.9463 0.167711 28.8522C0.107555 28.6298 0.055599 28.3992 0 28.1695ZM2.06172 2.06719C2.06172 2.16472 2.05169 2.23125 2.05169 2.29779C2.05169 10.716 2.05169 19.1339 2.05169 27.5516C2.04802 27.9576 2.12549 28.3603 2.27959 28.7361C2.43368 29.1118 2.66128 29.4529 2.94902 29.7395C3.23676 30.026 3.57884 30.2522 3.95519 30.4047C4.33154 30.5573 4.73458 30.6331 5.14063 30.6277C11.7244 30.635 18.3079 30.635 24.891 30.6277C24.9714 30.6214 25.0512 30.6092 25.1298 30.5913C24.3624 29.5303 24.1199 28.371 24.1217 27.115C24.1363 18.9118 24.1385 10.7087 24.1281 2.5056V2.06081L2.06172 2.06719ZM26.1816 9.17656V11.0496C26.1816 16.5044 26.1816 21.9592 26.1816 27.4139C26.1816 28.2342 26.4077 28.9634 26.9536 29.5796C27.6053 30.3142 28.4393 30.5822 29.4146 30.6423C31.6021 30.7754 33.003 29.184 32.9793 27.1113C32.9118 21.2707 32.9556 15.4283 32.9556 9.58672V9.17656H26.1816Z" fill="black" />
                    <path d="M21.8066 18.558C21.8066 19.7733 21.8066 20.9913 21.8066 22.2121C21.8066 22.9841 21.402 23.3833 20.6217 23.3833C18.1742 23.3833 15.7266 23.3833 13.279 23.3833C12.5034 23.3833 12.1005 22.9813 12.0996 22.2075C12.0996 19.7484 12.0996 17.2893 12.0996 14.8302C12.0996 14.0819 12.5098 13.6772 13.2663 13.6763H20.6427C21.3956 13.6763 21.8039 14.0837 21.8048 14.8347C21.8085 16.0761 21.8066 17.3166 21.8066 18.558ZM19.7294 21.3198V15.7444H14.1695V21.3198H19.7294Z" fill="black" />
                    <path d="M13.1241 6.97627C10.5963 6.97627 8.06914 6.97627 5.54258 6.97627C4.74141 6.97627 4.2237 6.25986 4.51992 5.56624C4.70221 5.13695 5.05039 4.92822 5.52253 4.92822C6.26263 4.92822 7.00243 4.92822 7.74193 4.92822C12.0458 4.92822 16.3491 4.92822 20.6518 4.92822C21.4885 4.92822 22.0117 5.60726 21.7328 6.32275C21.5688 6.74293 21.1969 6.97718 20.6755 6.97718C18.581 6.97718 16.4865 6.97718 14.3919 6.97718L13.1241 6.97627Z" fill="black" />
                    <path d="M13.1159 11.3521C10.5882 11.3521 8.061 11.3521 5.53443 11.3521C4.72141 11.3521 4.20917 10.5974 4.54277 9.90109C4.74602 9.47726 5.10241 9.30044 5.56725 9.30226C7.22975 9.30226 8.89134 9.30226 10.5538 9.30226C13.9341 9.30226 17.315 9.30226 20.6965 9.30226C21.5169 9.30226 22.0346 10.0378 21.7128 10.7387C21.5105 11.179 21.1413 11.3549 20.6628 11.354C18.1472 11.3491 15.6316 11.3485 13.1159 11.3521Z" fill="black" />
                    <path d="M13.157 25.7084C15.6726 25.7084 18.1886 25.7084 20.7048 25.7084C21.5051 25.7084 22.0209 26.4257 21.7229 27.1203C21.5406 27.5505 21.1906 27.7583 20.7203 27.7583H18.5328C14.2526 27.7583 9.97207 27.7583 5.69126 27.7583C5.54368 27.7655 5.39576 27.7567 5.25011 27.7319C4.99822 27.6802 4.77507 27.5355 4.62518 27.3266C4.47528 27.1177 4.40967 26.8599 4.44142 26.6048C4.47317 26.3496 4.59995 26.1158 4.79648 25.95C4.993 25.7842 5.24481 25.6986 5.50167 25.7103C7.89273 25.7066 10.2835 25.7066 12.6739 25.7103L13.157 25.7084Z" fill="black" />
                    <path d="M7.08032 17.3676C6.55714 17.3676 6.03396 17.373 5.51169 17.3676C4.90284 17.3603 4.45167 16.9283 4.44347 16.3586C4.43526 15.7743 4.89281 15.3241 5.51716 15.3204C6.57324 15.3138 7.63023 15.3138 8.68813 15.3204C9.31886 15.3204 9.77458 15.7616 9.77276 16.3467C9.77094 16.9319 9.31703 17.3621 8.67901 17.3685C8.14854 17.3721 7.61443 17.3676 7.08032 17.3676Z" fill="black" />
                    <path d="M7.10964 21.7436C6.58646 21.7436 6.06419 21.7436 5.54102 21.7436C4.90299 21.7381 4.44727 21.3125 4.44727 20.7291C4.44727 20.1458 4.90299 19.6965 5.55833 19.6946C6.59132 19.691 7.62431 19.691 8.65729 19.6946C9.31445 19.6946 9.77657 20.1276 9.77201 20.7246C9.76745 21.3216 9.30717 21.7399 8.64454 21.7436C8.13412 21.7454 7.62279 21.7436 7.10964 21.7436Z" fill="black" />
                </svg>
                <!-- <img src="<?= BASE_URL ?>public/images/icons/actus.svg" alt="Page actus"> -->
                <h2>Actus</h2>
            </a>
            <a href="index.php?action=presentation">
                <svg viewBox="0 0 517 515" fill="none">
                    <path d="M258.998 0C401.211 3.30154e-05 516.498 115.287 516.498 257.5C516.498 399.713 401.211 515.001 258.998 515C116.808 514.999 1.04283 399.91 0.998047 257.581C0.953248 115.207 116.762 -3.30206e-05 258.998 0ZM258.998 478C380.678 477.9 479.408 379.2 479.498 257.5C479.588 135.56 380.898 37.02 258.998 37C137.098 36.98 38.5004 135.721 38.5004 257.581C38.5004 379.441 137.078 478.09 258.998 478Z" fill="black" />
                    <path d="M316.43 381.37C316.172 382.729 315.992 384.101 315.89 385.48C315.76 397.48 307.64 401.77 297.77 404.69C288.44 407.45 279.41 411.69 269.91 413.33C251.14 416.65 232.54 416.25 216.72 403.25C207.84 395.96 203.29 386.47 202.94 374.8C202.43 357.97 207.25 342.13 211.43 326.17C216.75 305.9 222.65 285.76 227.57 265.39C228.98 259.55 228.42 253.04 227.77 246.95C227.1 240.6 222.77 237.4 216.27 235.95C206.93 233.86 198.08 235.75 189.27 238.37C186.97 239.06 184.72 239.89 182.07 240.78C183.18 235.47 184 230.36 185.43 225.42C185.762 224.518 186.28 223.696 186.95 223.007C187.62 222.318 188.428 221.777 189.32 221.42C204.45 216.49 219.38 209.98 234.93 207.57C252.93 204.78 271.26 206.34 285.06 221.47C294.06 231.34 295.94 243.07 294.64 255.8C291.64 285.36 280.15 312.8 273.36 341.42C271.51 349.18 269.63 357.09 269.23 365C268.64 377 272.47 385.69 287.58 386.06C296.601 386.315 305.582 384.772 314 381.52C314.603 381.328 315.223 381.191 315.85 381.11C316 381.08 316.14 381.23 316.43 381.37Z" fill="black" />
                    <path d="M320.94 137.08C321.16 155.56 305.36 170.78 288.4 173.16C275.33 174.99 263.9 171.96 254.4 163.47C248.069 157.951 243.981 150.301 242.91 141.97C240 120.88 255.51 105.42 272.11 101.53C294.11 96.3702 316.021 108.44 320.951 132.09C321.112 133.75 321.109 135.421 320.94 137.08V137.08Z" fill="black" />
                </svg>
                <!-- <img src="<?= BASE_URL ?>public/images/icons/forum.svg" alt="Présentation de Zoey"> -->
                <h2>À propos</h2>
            </a>
            <!-- <a href=""><img src="<?= BASE_URL ?>public/images/icons/forum.svg" alt="Page actualitées">
                <h2>Forum</h2>
            </a> -->
        </div>
        <a href="index.php" class="feedMenu">
            <h2>Feed</h2>
        </a>
        <svg width="115" height="100" viewBox="0 0 115 100" fill="none">
            <path d="M114.999 100V0H112.998C112.998 0 101.401 47.3435 55.998 47.3435C10.5947 47.3435 1.99911 0 1.99911 0H0V100H114.999Z" fill="white" />
        </svg>
        <div class="menuInner">
            <!-- <a href="index.php?action=presentation"><img src="<?= BASE_URL ?>public/images/icons/profil.svg" alt="Page qui sommes-nous ?"><h2>Qui sommes-nous ?</h2></a> -->
            <a href="index.php?action=adoption">
                <svg viewBox="0 0 35 35" fill="none">
                    <title>Page qui sommes-nous ?</title>
                    <path d="M0 31.3135C0.0546875 31.1309 0.103906 30.947 0.164063 30.7665C0.369773 30.1399 0.764834 29.5925 1.29475 29.1999C1.82467 28.8073 2.46334 28.5888 3.12266 28.5746C4.13574 28.5548 5.14951 28.5684 6.1626 28.5671H6.58506C6.58506 28.3941 6.58027 28.2512 6.58506 28.1083C6.63906 26.7792 6.57344 25.4316 6.77373 24.1244C7.29873 20.6956 9.08769 18.0251 11.939 16.0567C12.9691 15.3463 14.0396 14.6825 15.0056 13.8928C17.2231 12.0803 18.3996 9.69624 18.6512 6.85068C18.6853 6.57979 18.6181 6.30586 18.4625 6.08152C18.2813 5.81966 18.1569 5.51678 17.9621 5.26791C17.5068 4.68745 17.5048 4.05093 17.6784 3.38774C18.1574 1.55815 19.3231 0.449419 21.1757 0.0615331C21.2283 0.045833 21.2793 0.0252318 21.3281 0L27.6172 0C27.8605 0.179813 28.1278 0.33433 28.3432 0.542858C29.1334 1.31134 29.9093 2.09486 30.6852 2.87906C30.8133 3.01594 30.9693 3.12374 31.1427 3.19521C31.316 3.26668 31.5027 3.30016 31.69 3.29339C32.3606 3.28176 33.0319 3.30911 33.7012 3.2845C34.3349 3.26194 34.7778 3.49508 35 4.10494V8.48062C34.9766 8.51844 34.9583 8.55911 34.9453 8.60164C34.7115 9.99228 33.9685 11.0267 32.7626 11.7419C32.0585 12.1598 31.3562 12.581 30.6558 13.0054C30.0836 13.352 29.6864 13.8422 29.5709 14.5061C29.5248 14.7559 29.5545 15.0138 29.6563 15.2465C30.7979 17.4897 30.8007 19.72 29.6447 21.9557C29.567 22.1048 29.5242 22.2696 29.5196 22.4377C29.5114 24.43 29.5196 26.423 29.5087 28.4153C29.5087 28.643 29.5771 28.7489 29.7862 28.8446C30.8581 29.3383 31.5267 30.1724 31.6552 31.3484C31.7406 32.125 31.6825 32.9168 31.7146 33.701C31.7406 34.3341 31.5096 34.7798 30.8984 35H2.80273C2.72822 34.9774 2.65439 34.9508 2.57852 34.9316C1.50391 34.6951 0.72666 34.0756 0.273438 33.0685C0.151074 32.7951 0.0875 32.4915 0 32.2023V31.3135ZM29.6591 32.9366C29.6591 32.59 29.6591 32.2727 29.6591 31.9555C29.6618 31.8642 29.6591 31.7729 29.6509 31.682C29.5825 31.0844 29.1519 30.6735 28.5448 30.6202C27.8141 30.5566 27.4647 30.1806 27.4641 29.4422C27.4641 26.9809 27.4559 24.5196 27.4736 22.0582C27.4806 21.766 27.5595 21.48 27.7033 21.2255C28.7116 19.4691 28.713 17.7297 27.7033 15.9747C27.5614 15.7314 27.4816 15.4569 27.4709 15.1754C27.4531 13.4586 28.1442 12.1152 29.6379 11.2195C30.3502 10.7922 31.0639 10.367 31.7748 9.9369C32.5609 9.46014 32.9529 8.76117 32.9506 7.83999C32.9506 7.22466 32.9506 6.60933 32.9506 5.994V5.34107C32.5015 5.34107 32.1036 5.33492 31.7064 5.34107C30.7296 5.35953 29.91 5.00879 29.2264 4.31552C28.5428 3.62225 27.8448 2.92555 27.1428 2.24254C27.0337 2.13612 26.8907 2.07129 26.7388 2.05931C25.1095 2.047 23.4805 2.04586 21.8518 2.05589C21.3507 2.05368 20.8641 2.22359 20.4732 2.5372C20.0824 2.85081 19.8111 3.28911 19.7046 3.77881C19.6704 3.95131 19.6977 4.13032 19.7818 4.28475C20.4477 5.42516 21.1326 6.55395 21.8128 7.68548C21.8627 7.76957 21.9215 7.84888 21.9926 7.95417C22.0862 7.83589 22.1648 7.74086 22.2387 7.64241C22.9291 6.7226 23.6191 5.80234 24.3086 4.88162C24.5677 4.5343 24.8985 4.34287 25.334 4.4126C26.142 4.54114 26.4687 5.40534 25.9595 6.09246C24.9225 7.49267 23.8731 8.88401 22.8259 10.2767C22.2229 11.078 21.432 11.0322 20.9118 10.1694C20.7293 9.86648 20.5454 9.56497 20.3383 9.22449C20.2925 9.35439 20.2699 9.41729 20.248 9.48293C19.5754 11.8109 18.3483 13.7998 16.4753 15.334C15.3945 16.2187 14.2058 16.9715 13.0573 17.7762C10.3852 19.653 8.8375 22.2039 8.68232 25.4726C8.56611 27.9059 8.64268 30.3481 8.63584 32.7882C8.64221 32.8402 8.65483 32.8911 8.67344 32.94H22.8662C22.56 31.6786 21.2509 30.6838 19.8399 30.6243C19.0682 30.5922 18.6929 30.2182 18.6628 29.462C18.6512 29.0281 18.5534 28.6008 18.3751 28.205C18.1968 27.8092 17.9417 27.4528 17.6244 27.1566C16.9586 26.516 16.1465 26.2568 15.2373 26.2069C14.6426 26.1741 14.2516 25.6969 14.2851 25.1287C14.3172 24.5859 14.767 24.1777 15.3385 24.1716C17.7939 24.1524 20.0416 25.9314 20.5687 28.3278C20.6206 28.5616 20.7259 28.6402 20.9426 28.7236C21.564 28.9643 22.1655 29.2549 22.7739 29.529C22.8721 29.5808 22.9674 29.6376 23.0597 29.6993V29.2344C23.0597 27.2398 23.0597 25.2456 23.0597 23.252C23.0555 23.0815 23.0704 22.9111 23.1041 22.744C23.1571 22.5258 23.2811 22.3315 23.4565 22.1914C23.6319 22.0514 23.8489 21.9735 24.0733 21.9702C24.2978 21.9668 24.517 22.0381 24.6965 22.1728C24.8761 22.3076 25.0058 22.4981 25.0653 22.7146C25.1009 22.8932 25.1149 23.0755 25.107 23.2574C25.107 26.345 25.107 29.4326 25.107 32.5202V32.9393L29.6591 32.9366ZM6.5625 32.9544V30.6182C5.44004 30.6182 4.33877 30.612 3.23818 30.6182C2.55459 30.6236 2.05762 31.1179 2.05146 31.7681C2.04531 32.4183 2.56006 32.9455 3.24912 32.9544C4.10225 32.9633 4.95811 32.9544 5.80986 32.9544H6.5625Z" fill="black" />
                </svg>
                <!-- <img src="<?= BASE_URL ?>public/images/icons/adoption.svg" alt="Page adoption"> -->
                <h2>Adoption</h2>
            </a>
            <a href="index.php?action=account">
                <svg viewBox="0 0 26 32" fill="none">
                    <title>Page adoption</title>
                    <path d="M4.80838 32.0001C4.44441 31.9205 4.07432 31.8625 3.71798 31.7551C1.50511 31.0886 0.117102 29.3148 0.020194 26.8937C-0.0805297 24.3802 0.182727 21.9042 1.09992 19.5506C1.69129 18.0322 2.54973 16.7182 3.98962 15.9149C4.8603 15.4259 5.83797 15.1815 6.82667 15.2054C7.14105 15.2117 7.47222 15.3772 7.75913 15.5402C8.21697 15.8019 8.64962 16.128 9.0983 16.4152C11.7074 18.0945 14.3161 18.0924 16.9242 16.4088C17.2867 16.1749 17.656 15.9499 17.9925 15.6842C18.6159 15.1966 19.3027 15.1354 20.0444 15.2491C22.0672 15.5593 23.4964 16.7142 24.4594 18.5572C25.3201 20.202 25.707 21.9893 25.8795 23.8298C25.9687 24.7771 26.0084 25.7287 25.9985 26.6805C25.9657 29.5169 24.0985 31.6278 21.3919 31.9388C21.3242 31.9525 21.2578 31.9724 21.1935 31.9985L4.80838 32.0001ZM13.0052 30.0911V30.0864C15.5835 30.0864 18.1627 30.1094 20.741 30.0784C22.8837 30.053 24.1992 28.6284 24.1817 26.3981C24.1801 25.5517 24.1368 24.7058 24.0519 23.864C23.8909 22.3528 23.5941 20.8805 22.889 19.5259C22.1619 18.1205 21.1081 17.2105 19.5209 17.1191C19.3728 17.1135 19.2261 17.1512 19.0974 17.228C18.7044 17.4667 18.3275 17.7379 17.9406 17.9908C15.0578 19.8759 12.0727 20.1145 9.00292 18.5404C8.28717 18.173 7.63399 17.6759 6.94877 17.244C6.84804 17.1803 6.72748 17.1024 6.61912 17.1071C5.63402 17.1533 4.74963 17.4762 4.04075 18.2207C3.45243 18.8379 3.0419 19.5784 2.74355 20.3834C1.98049 22.441 1.79354 24.599 1.8439 26.7743C1.87137 27.9674 2.36431 28.9386 3.37918 29.5638C4.05525 29.9798 4.80381 30.0919 5.57526 30.0919L13.0052 30.0911Z" fill="black" />
                    <path d="M20.4851 7.6267C20.498 11.7992 17.1789 15.1635 13.0139 15.1996C8.90971 15.235 5.53743 11.843 5.51614 7.65512C5.50449 6.65531 5.68901 5.66307 6.05903 4.73578C6.42904 3.80849 6.97722 2.96453 7.67187 2.25269C8.36652 1.54085 9.19386 0.975257 10.1061 0.588599C11.0183 0.201942 11.9973 0.00189178 12.9864 1.33526e-05C13.9756 -0.00186508 14.9553 0.194467 15.8689 0.577657C16.7826 0.960847 17.612 1.5233 18.3093 2.23249C19.0066 2.94168 19.5579 3.78356 19.9314 4.70944C20.3048 5.63532 20.493 6.62684 20.4851 7.6267V7.6267ZM12.9995 13.3596C14.1197 13.3599 15.2148 13.0244 16.1464 12.3956C17.0779 11.7667 17.8041 10.8728 18.2331 9.82674C18.662 8.78071 18.7745 7.62959 18.5563 6.51895C18.338 5.40831 17.7989 4.38803 17.007 3.58713C16.2151 2.78623 15.206 2.24068 14.1074 2.01948C13.0088 1.79827 11.87 1.91134 10.835 2.34439C9.79992 2.77743 8.91515 3.51101 8.29256 4.45234C7.66996 5.39368 7.3375 6.5005 7.3372 7.63284C7.33489 8.38528 7.47975 9.13077 7.76345 9.82642C8.04715 10.5221 8.4641 11.1542 8.99031 11.6864C9.51652 12.2186 10.1416 12.6404 10.8297 12.9275C11.5177 13.2147 12.2551 13.3615 12.9995 13.3596Z" fill="black" />
                </svg>
                <!-- <img src="<?= BASE_URL ?>public/images/icons/profil.svg" alt="Page profil"> -->
                <h2>Profil</h2>
            </a>
        </div>
    </nav>
    <a class="feed" href="index.php"><img src="<?= BASE_URL ?>public/images/icons/feed.svg" alt=""></a>
    <nav class="menu menuBlur">
        <svg width="112px" height="100px" viewBox="0 0 112 100">
            <path fill="rgba(0, 0, 0, 0.5)" d="M112 100V0C112 0 100.652 47.3435 54.7663 47.3435C8.88072 47.3435 0 0 0 0V100H112Z" />
        </svg>
    </nav>

    <!-- CONTENT -->
    <?= $viewContent ?>

    <?php

    // NEWSLETTER
    /* if (isset($printNewsletter) && !$printNewsletter) {
        $printNewsletter = true;
    } else if (isset($_SESSION['idUser'])) {
        $printNewsletter = true;
    } else {
    ?>
        <form class="newsletter" id="newsletterForm">
            <h1>Rejoignez notre Newsletter !</h1>
            <input type="text" name="prenom" id="newsletterName" placeholder="Votre prénom">
            <input type="email" name="email" id="newsletterMail" placeholder="Votre e-mail *" required>
            <input type="submit" value="S'abonner" id="submitNewsletter">
            <p>*: Champs obligatoires</p>
            <span id="confirmationMessageNewsletter"></span>
        </form>
    <?php
    }
    */

    if (isset($printLegal) && $printLegal) { ?>
        <div class="legalLink">
            <a href="index.php?action=legal">Mentions légales</a>
        </div>
    <?php
    }
    ?>

    <?php
    if (isset($_SESSION['idUser']) || (isset($_COOKIE['g']) && $_COOKIE['g'] == 'd') || isset($_GET['g']) && $_GET['g'] == 'd') {
    ?>
        <div id="googleAuth" hidden></div>
    <?php
    }
    ?>

    <!-- prompt PWA : hidden by default -->
    <div class="promptPWA" id="promptPWA" style="display:none;">
        <div class="popUpWrapper">
            <div class="popUpInstall">
                <div id="promptPWAclose"><img src="<?= BASE_URL . 'public/images/icons/popUp/croix.svg' ?>" alt=""></div>
                <div class="btn" id="promptPWAinstall">Installer l'appli 😺</div>
                <p>Pour une meilleure expérience sur Zoey !</p>
            </div>
        </div>
    </div>

    <div class='loader' id="loaderContainer" style="display: none;"><img src='public/images/icons/loader.svg'></div>

    <script src="<?= BASE_URL ?>public/js/post.js"></script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script src="<?= BASE_URL ?>public/js/googleAuth.js"></script>
    <?php if (isset($scriptsBlock)) echo $scriptsBlock ?>

    <script src="script.js"></script>
    <script src="public/js/notifications.js"></script>
</body>

</html>