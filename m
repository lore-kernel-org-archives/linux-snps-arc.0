Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55683C636D7
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Feb 2023 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeDujFCeik3iJJITbCuE8OcxaNWlmoLPDBCqlIOLxeo=; b=nTvJiwR1lNyfJr
	B98iaH8ZhZF98jMKzTDffXVqFxDogR9Lrnk+BRfdY7IP9sMpPDGZlwuf+6yzBAbkduxEo66uwKBd9
	72ssuvS8VmMVEsFW86Gi6xHCLQCfquVTLeK1HLNx/Y5FrnHr40wIvZ1X/Uq/G3Tkymly8WrhgIXK5
	/ENotUYhFZIPRFa+quVVRs3z4orFl/2VtKNB/j6KZ2NG4cokXdxY7Z5biPuhkdtU793aZM47uDq5h
	W8HcdLBxaODPUR6OFFwmn+L7U4298QSirUdkOkO0CtiwRBavY3H2c3yUiUaiFF90O8WoX+CtOqZR3
	JfMc/OB3wKkBjCP7zEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNECG-00COio-98; Wed, 01 Feb 2023 14:34:48 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNE2e-00CKVi-Mz
	for linux-snps-arc@lists.infradead.org; Wed, 01 Feb 2023 14:24:54 +0000
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311CaSOe001661;
	Wed, 1 Feb 2023 06:24:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=XtyoNv1Nfxz3omx4ckXB4ODYyWDvkJOhsh+5QO6QFqQ=;
 b=LNQrXZeHlQaZNbsM/uTWbij1Q+6s/OM0Wb0mPL/kblorjYOR+7etbEpPyZlGqso5laGt
 H6CVZXuV6f0O1RuuXmnzrc8thwmEaN3P+WFfL6VgJeM1pLLXVWwcD9kghduQMprbDv1C
 bn/0exU+sh9wO2JFL1IqdjdbHLsBiyTw7EOcwRRGZPIfubvzPdrZFL6WVtZJeuD+ruV3
 bIe0E/2/RwnRId2DncjioF6vfk3EztlW1RGzXfVoxkbA/OFXxdhXY2UubZqM5HLgHPGM
 b0sTfCsgsf0iCJATO8YAcbhjQan7sDnasOU+xDI1vtWYx5g6v6gV6D4UHN9CjGXEXNv1 /Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3nfqbp8y0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:24:47 -0800
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E6296400B4;
	Wed,  1 Feb 2023 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1675261486; bh=XtyoNv1Nfxz3omx4ckXB4ODYyWDvkJOhsh+5QO6QFqQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bgY1Onl9aJKGpSGh2W6bumMd0HdU+tr1ZF8DCwcERFhzqQHSRdOTg9p9g9bJ6ja8z
	 DbGlryNLx1nEuZbrEYkeeXypwNPrwktBkhGgRehJ4X4Hl3fbIBrsEBexw9gvVBk2kH
	 sKFd1oZFr+CO9kKEyDuq+yAC2NZz/b9G7OA/+uTfCtVRgO61Sd7gTs8Um0eIq3z+Lq
	 H/Qd4WoeTRg+s/oPJkJCF8thCw2LqoPe//w293TjE6jMVkY0NattJw/3Q/YIJf5pfp
	 ly1yckZfKiaOAMWmPG1IhWAB5g7vVvqn6opl3HaPLTYktkCX0TyicDS9QBbqH15Wxr
	 sTIOZCa5I7z9Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 508A3A005C;
	Wed,  1 Feb 2023 14:24:43 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8D05C400A6;
	Wed,  1 Feb 2023 14:24:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=kozlov@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="DpbNPT6x";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYzvG5ndmGWk0uxKtMbw3NKH0J8HgyqSHMO5rA6GWVz+pmpU4eaW/K6t1eamWNgy5PvM6mZSmDlN1qubrADGO5Y86kPVnpgZ4ngIMNQF6e+5GvG54Ai+nSpZtX+XtlxSIN6X2XwnXKU66GKvSqI/kLcfHaBIPr4VgSYFvHZESlGMQ6ikVrKCpDnuofSRw/XvBN4JZ3FDyDTz1d24jfH5x6t7CaBj5gGn382P2k/m3TiS29/M97eVFmMkYZ3i2LzuQuhDPM6B1GQd4FqXGOIXCQI1tsuebdtfCPi0iArA2G4Uzx6nH+TLNcGugFulraAt21DF7IDkEvNwVzlDNNkUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtyoNv1Nfxz3omx4ckXB4ODYyWDvkJOhsh+5QO6QFqQ=;
 b=Y0+cs5qcbSXvWb347GqJdkOQJ3AWfIKc/CvV7pAFCb7huX8FuI7kxUv0Gvrq6w9oajlX7AqRepSyBzZHpQ9W03KUe8v0BHh/WkOv6Isl0DkFFS5xJgxequ995mmgQuAF4aicMeNiEZbhNU+g/RZZdNZ++mpdlOrRGyI5REAUHdmWwLO8UjZanb0YDNaO7XzUe2Yi213TYJQNsHOraFO8NpfH/TIhqLbiLlhtOxfGwwCL14FPqPho/Ku+XqbhMdYcnSmseeJz1/J9oIcNa0xT0ReIkSLh5ECrdGTb3WS79E7E63FtGrkTqM3mUQ25cOgc8zB4k0fSG5QnItILrwSXRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtyoNv1Nfxz3omx4ckXB4ODYyWDvkJOhsh+5QO6QFqQ=;
 b=DpbNPT6xvhQd81YLBkrEyReQHMW7OJ1JaZG/xp8cYBDklSDZ34Ahlu7KnCsATxVBFGL5cw5/fDGq1Wkxekk2n+mYPgro57Z/8sHZyDWnuZuUMkerGYBdPzSF6vU8cJfvIW1dy1MM1EzG7Ng3XRIpozxzu7b9M3PtT02nORtMjPU=
Received: from DM6PR12MB3146.namprd12.prod.outlook.com (2603:10b6:5:11b::13)
 by BN9PR12MB5211.namprd12.prod.outlook.com (2603:10b6:408:11c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 14:24:39 +0000
Received: from DM6PR12MB3146.namprd12.prod.outlook.com
 ([fe80::83c1:317c:38bd:9640]) by DM6PR12MB3146.namprd12.prod.outlook.com
 ([fe80::83c1:317c:38bd:9640%7]) with mapi id 15.20.6043.021; Wed, 1 Feb 2023
 14:24:39 +0000
X-SNPS-Relay: synopsys.com
From: Pavel Kozlov <Pavel.Kozlov@synopsys.com>
To: Carlos O'Donell <carlos@redhat.com>, Vineet Gupta <vineet.gupta@linux.dev>
CC: arcml <linux-snps-arc@lists.infradead.org>,
        GNU C Library
	<libc-alpha@sourceware.org>
Subject: Re: Pavel steping up for ARC glibc maintenance
Thread-Topic: Pavel steping up for ARC glibc maintenance
Thread-Index: AQHZNSElhNPrYjEu8k2Ypv/HuaTVba64/G+AgAD8XHE=
Date: Wed, 1 Feb 2023 14:24:39 +0000
Message-ID:  <DM6PR12MB31463258B455490C43350D85BCD19@DM6PR12MB3146.namprd12.prod.outlook.com>
References: <323b6822-6442-0aca-15dd-3e58ed2c6953@linux.dev>
 <8c92778c-edd6-12d7-848a-61dd586bd73d@redhat.com>
In-Reply-To: <8c92778c-edd6-12d7-848a-61dd586bd73d@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB3146:EE_|BN9PR12MB5211:EE_
x-ms-office365-filtering-correlation-id: 9ca4313b-2470-4c80-9651-08db04600d85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qwxd33icjGIvmWWLXWfBJWmpuncoNeffA6r33/jL+mcRy9RS/DC9paKXA/bSYhfNNo5O1gs9BNBwjGw8XiKaWRXdXMBFGKhX2POWDWhTu2EfAW21evZUDsmTfsq6/tOK9ORvna0iqIIOmbCs5KM9nrHq7Wbv5ycmSkxtnYZqcxgC9zPqbxe/NZnkXmR5HZKC6f9hATK2M1zAFb985VDCX1qiV8ddrSgZRIpLOWxVy0V+899uH4OvdZ+lgVJGLJ10nx4hFJuK/dr84b66RBo8TamHAuSPkHJXajaedzw38j0E1Q5wRmUXTctaGgPm5fN5d0t0U9e+35yadYpwa4G6VtKL3G73jd9v92Zzezp+irOsmqF+7Jivzm4D/yqxpRE/v+bjYoQsV/k+fqUxyM0We2umcJfKyeOlMOUu6iaGpbKuCYv/RWm1t/muDcdGaE8zzlcBz/GBDiBm9b0DRgaQD2KYz2hrokR1UuLsAYFzGnNcfpzlUXzM9bBzTxZjDyeLRd+eUE76pasFLBctLqojL03GkisP9qL9F/efUBN0giHwNXyqSpYAW5CitMVxW6InFjNKSVPBmKmorX6P5mds/Q5ToRy+DtbF9jH7OEz6HESt20jdNGM5G2Mb9ue8MJvyF6OTeHYNzFGYEOibpx0eY0POYVbNdKgjtMdfVQ1XX/4YMdEpFaHGR9WCL2KDeMJ53aeEejAnlNrrqoAu0sm7gDIWb/zCy8aiTNbTco2xVhY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3146.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(41300700001)(122000001)(64756008)(91956017)(66946007)(54906003)(316002)(8676002)(4326008)(66476007)(8936002)(66446008)(66556008)(76116006)(5660300002)(52536014)(110136005)(38100700002)(86362001)(33656002)(38070700005)(6506007)(66899018)(186003)(9686003)(966005)(26005)(53546011)(71200400001)(2906002)(55016003)(7696005)(83380400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?937n74AYidKi0pz83N7LjDb3rLaY4ecEm1zxAC+nLg1b+yqsFFzVwTm6BH?=
 =?iso-8859-1?Q?ZOAqnEGeNEqQCv9ZhpxHIS91uAvwOQqfpTbrSJbtp3112bEKwbwEnHgXk8?=
 =?iso-8859-1?Q?PoSH7UswZbkSVgvr432Onuo37ZM3MuO76n1/ZmVjQiFgr9eCQm1NprUM56?=
 =?iso-8859-1?Q?HP7IauOp4DUBEn2zAQy98qenzV3kZztMUDlofAdtaBBWI9tMZnN9LXqfY6?=
 =?iso-8859-1?Q?YtDKjqvo1V5DrM10W7osOQ/OllsTD9cPhHOwSZvj5sYa50vhPcY11PDPHM?=
 =?iso-8859-1?Q?Rt+YCwgTPCrTShkd+LJTFoGT4YxErNEr46WbEumDOJrkLTNOIRl6Ot+LX2?=
 =?iso-8859-1?Q?IttCR4Xm0MzKsLH/EbT1zeocmdYivlK+5KMUZIGpUOsiPEHm+ZiYt1vw9r?=
 =?iso-8859-1?Q?LmrDS2+IP/EVnN5o3jg2yOcU39lIqGYPi/ASRMA9/UNrYgO86YD5NQUqfF?=
 =?iso-8859-1?Q?TWa6RogXCwIw5+0NbNM76fKxYbi+hI1v2d04Lf98SLre/EETcHUbG/UdMP?=
 =?iso-8859-1?Q?Fo+UNkEYaVOHNY2wbaByc5s/XHLi7eXa/V4FUQZZ5ApPdpZli8OTfQfnjp?=
 =?iso-8859-1?Q?LLrky2ap+piYUW2PTWJYnodMocx6g4yCvW2LPWlRMbrm039hLRH87iVmD7?=
 =?iso-8859-1?Q?Op0F2TB3KL2+T6ySeqtt5IO6yZJFMKc8sXXSH57OYg2ThnthvjbE1xzRDx?=
 =?iso-8859-1?Q?w0DZlVKilF9cDKw3pKIKt6x4ewAMHhd6dT+D6FgzEbCu/QtJKX26n1B9sG?=
 =?iso-8859-1?Q?9f0Tc980BW/Kd15R7p+CbwotpgBgg+Uxzb+jMNE5/Vz2KbImc69Z2pr2Fl?=
 =?iso-8859-1?Q?SWTkyVEGAzSu/fJBeELe2mfaBVJk8qQqfWWRxHrAaSqz+WqeB2F2XdXFat?=
 =?iso-8859-1?Q?BjXVS8LYjbAU2xCrf5CFcOaVSTJ6baockX0T5b/66w859B8gzftPiA0YcB?=
 =?iso-8859-1?Q?tPQuTIpahFlwMhuwtmre4elE++VvCQG8eNTxsE5P1/fTO07kzVp3WpXHIU?=
 =?iso-8859-1?Q?Zq2b+hm3TLzVZuYgwPNuKFVMNPtD2bhzeYb5BNg3y9hnWoUd3Cmia5gInk?=
 =?iso-8859-1?Q?LpQj5HNrOM4C9IPo7ckR/ptbrT4tAajyERBhs2IS/JjbD19R2RDqaAEsM0?=
 =?iso-8859-1?Q?fI54TaqV8Mg/Cm1Z7zDkT01sbbGJI2D81XtPupCSN9Evaa9T0TUw2gpore?=
 =?iso-8859-1?Q?S7mtzra08jiyyTonoWlXuGhqaIfqI10XZyQnG69G4yYsf2HEFe2l4894He?=
 =?iso-8859-1?Q?siawKOjgkbhpH6X96o1e+dCYbeXPEjXdTMAXjyaoCNN9dSb5iicg0wotHb?=
 =?iso-8859-1?Q?L76cRYe3KB/APIGovPGYf1o6OXhRheQnuqdGFkH3WIgchOU1GWlerMyB+c?=
 =?iso-8859-1?Q?mZbiwIkvLeGO/3NdLkosEcG73d5QhNhIE4MjgDBLq0nCQj/0Un5IGy4qbw?=
 =?iso-8859-1?Q?xtbOr2PG8kbczSj3us5hJq2KWZ27YlmJingizrz+yvLgIWW3FXgVtuwu5R?=
 =?iso-8859-1?Q?G79yoGdZ22apxFEIN98rRvzW7vwzMDDG5R0dBZ1VauCRma3FfNHpLTlUuE?=
 =?iso-8859-1?Q?7GbemOvI0TFXI2Kwa9mwkOGMLbyKkV7OHBBada06Wa7h8iLAYh+A620so+?=
 =?iso-8859-1?Q?8IOGd4vQOnVWTu81bWMcUBKgFosHlNn5Z4?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	hrfDyWsCvUSy4Oy23rOEip0F18KZDrHLnMcK6t3yHN/WVRrS/sMdqnbhoM5u0+sQGaIqKG500PIPflSaUMHciKiizGIbS60U4mrvZOpWIQxYIkHzQqos/DMX1UpSdwhEjGyzzQla2GCUbdL/KbnjguwZmg9R5J6fbzTX8yukAp2yzVFXP8K+g2k0QvZyZGj5cMSh2MIVADlLtx3/RjiVFejdzXURs5LYQIuPrX08OZvQcyFkzZ8aN1AOFAvmXKp1OiiimFcRMxEHWqt+wjMkJ5WXdLgmCbPiHbjW0aBWpxmeuvXFIyNLroGy/aP3I+BsDR6/2gs+NiyLAMh3FaAwWAtoAUh4Ukr+zuFJ4pVS4Y+icEerRa2v7CaZqVA3Ec0LV4lQuJEZXhoRQDioxVUGlOH6e2sXJoTKbxGo23hYwohJlIqzQ7UkvE56XkKxmiALtc0zf/x91/5ewQN+mF18b7ZGzqAM2M6k5Y7vJ0Kg5/dYGGCJy5nF+IpKUZhvqBxHO4E2QE6QUQY12cQU07gd8ANmT5NZS0/MUhoT21abmZYt0nMiZ7Uv0NAHHwYslUp4xwqUakbLNx4h2LbWsCDEt9LqbhEHH0efIN9IMA308i88S8D1+kem7f/PEqM+hAAzOIB/IWHCytcyNdLSQnkyvdBSLZnEJ6YPXSq/WuV+StflM2V0hQAuKXxtmadrChOsxZDNLrWjsVrKXx0m1/wNuAWWTQF2E4n3Jg1sLsKf6GozwqXNt3DZAcFUXw3zn5BY3Jlz2AWWanuCCGB3ukF9J5eB8GvJuV3Xzdb6JGCo2/6UuXQkz5cbmagt2apesp0YqzyfS4TsqERSB69CptdYtFYjlgYNTZNTHkpTxjue0U8S1V/dfLAu3pxSABlb4MGSJoadU2dcCTI7FIEXsWbmBg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca4313b-2470-4c80-9651-08db04600d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 14:24:39.2662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lb0bq8bZxIVjPBiFgMK0W3y+ZKHYPgncKfBVhTQ3uy7D9ryzKg78C2QYVvRm/bw49LF8wSXseYXjyPWAPaD4pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5211
X-Proofpoint-ORIG-GUID: 5LABtiTnNbkGcM2L7aPlgNfyujY98mzb
X-Proofpoint-GUID: 5LABtiTnNbkGcM2L7aPlgNfyujY98mzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 mlxscore=0 bulkscore=0 mlxlogscore=997 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_062453_174228_C2850006 
X-CRM114-Status: GOOD (  15.29  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Carlos,
Hi all,

Thanks for your greeting.
I'm glad to be here.

Can you please add me to the wiki EditorGroup?
My wiki account: PavelKozlov
I have some test results that I want to post for the coming release.

I intent to help to maintain ARC glibc port, so feel free to ask if
some code, HW verification or review will be required, all=A0concerning ARC.

I've requested the=A0sourceware.org account.
Looking forward to the next steps.

Thank you,
Pavel


From: Carlos O'Donell <carlos@redhat.com>
Sent: Wednesday, February 1, 2023 12:33 AM
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: arcml <linux-snps-arc@lists.infradead.org>; Pavel Kozlov <kozlov@synops=
ys.com>; GNU C Library <libc-alpha@sourceware.org>
Subject: Re: Pavel steping up for ARC glibc maintenance =

=A0
On 1/30/23 22:07, Vineet Gupta wrote:
> Hi Carlos,
> =

> I'd like to introduce Pavel who intends to step up to maintain ARC glibc =
port and do periodic wiki updates and such.
> I've pointed him to links [1] and [2].

Sounds great! Welcome Pavel!
=A0
> To begin with can he be granted wiki edit access and subsequently also ap=
prove his write access to glibc sourceware repo.

We can absolutely help with the next steps.

Please follow [2] and if you get stuck anywhere just reach out on IRC or by=
 email.

> Thx,
> -Vineet
> =

> =

> [1] https://urldefense.com/v3/__https://sourceware.org/glibc/wiki/MAINTAI=
NERS*Becoming_a_maintainer_.28developer.29__;Iw!!A4F2R9G_pg!aaKwbgpslcHvrrd=
ypX2BrPwxZt7I0x_g_mYJUHIfZhZk-D9UuJWQsmzd6SqrQWU9KTROPZ8zqEyfPU98J1EM$ =

> [2] https://urldefense.com/v3/__https://sourceware.org/glibc/wiki/MAINTAI=
NERS*AccountsOnSourceware__;Iw!!A4F2R9G_pg!aaKwbgpslcHvrrdypX2BrPwxZt7I0x_g=
_mYJUHIfZhZk-D9UuJWQsmzd6SqrQWU9KTROPZ8zqEyfPTXW0Rz_$ =

> =


-- =

Cheers,
Carlos.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
