Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB5CCAC587
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 Sep 2025 08:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4H1c+fDNoXpH7L5Z9H48kKt1U/hBsyZSgEFLpW0TSs=; b=DQp+YQwQHyePST
	xKFjxRh+d+1oQd0wJHus4im4kh0U2sBPSgJVTLk1CWjP42kHapCvEmGZzIg8mkiJdSV39k8ud8Ohp
	rC3+fbIKMTQIUsS5k4FzeMkHfavAGsuFTDB8sR3jBVYzuv7tJmMl2IGZZms+KG7ZNDW+LqUzIXPAE
	rkEqDok/FDzs6bG/495XXYkUcwMOKew6QCh50oThbkXqb5cAJ/Cz+JttU6A4kf05XG+Hb6Tfv60pm
	IldGBAaQz20f78DP0VmJJRi0so56J/JMVLkIc4xdkFZuQI7lvmhzW6caSJrO89fGuinqcyggh4/F6
	tx7VFHnJh3e2LzFNeIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxM5o-0000000Dzaw-0gHz;
	Sat, 13 Sep 2025 08:58:48 +0000
Received: from mail-germanywestcentralazlp170120004.outbound.protection.outlook.com ([2a01:111:f403:c20c::4] helo=FR4P281CU032.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxM5l-0000000DzY4-2R92;
	Sat, 13 Sep 2025 08:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unz+GwaXOMrNJfVpWglQMAY7rUGvAoKFKdr/1pQdisZ/jopx7kW5c0jmC/f0mfsnqffKbvgYyoZx2xzBYx5PlSzcrFP7wCB+bcX5hpjKyH7fS5DCcq51N1viklREFSjKgc41CGDVVp+i9oXvpAVMc5XkcHqTdSSveM4zdUSl4DkefG2KOU00fEfQlUPF+mJ/ZlGTSkz0kbReSAcwGmOoZqzaDkJm8CHlpM4jprDljUZ/unOB/JMkv5me3XTIaaSiAkcDOAkKAI/wlQRnnmYViZ7kZYBcoxjQZktkmC/nmbEmYERuZg3SpLrQ814PunDbFJgKzvX7rZ+sTQqT7GdnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dfdAhExD64i0DbF+CwkX379VUlZaZ5kAHQMSZbWJEs=;
 b=KbaqekWDPaCJG9KV809dHKZBfnLPY9OSDJuYyaK974T2ne4va4LvM7Uz4ymIgUmFhnloRRd+3iyw0tVuVqez2ii7hhRBNMMiJWUYB7cyINfY0XNQKNK+pj/Fg46Fm7qY9ShdRbQh+rof6r7aZiwumBiXNJ6a5eFLTQMI3c7AFwZnp58Ys2u40D+mUXuqfpfUq+x7yhIRa+/gKNXWrCttlT7AukQauylFIqEvCMmP8FkdOwlPETFkxgnETDgXXOXxBTS5zN6qOZJQ7i3+l/HaKV2rx/KqeuxAP12b4myzGCvr9FCNKfdQby3gmXf0g6bbk5mj9ULN8eUAizGVZmRmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cyberus-technology.de; dmarc=pass action=none
 header.from=cyberus-technology.de; dkim=pass header.d=cyberus-technology.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberus-technology.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dfdAhExD64i0DbF+CwkX379VUlZaZ5kAHQMSZbWJEs=;
 b=v8IwRRRaz0Swv/eDkePsNK1OqI2n1FnfYfnm4YrzUdW72wwYRuxeTzHIafEIgwLqMB7NfO/tYlolVtZonhoO5SHJNOGqwvLqDtd5Xjk895zqUT6Gc6dSulH0tgWEvLgvRN+EREbgvz66S/Y244n0/D7FsC5lAsbFoNTFcTH67xTY4QFt4l2onrYU9sPGbnfNhlFq5ztU+7cN0GJ4aE3TjEY1i5aH+fkfUxqUlXWz+EEZ5dmNL9wum/z1xlpgavQy31R0V/cNuEnNuYKuNa1XSki+29qHrmSK5cu1AglZeqiSHNT7iwepL+Twr2YPKgfKqcl0Af7XkvBiWqbPpMcj+g==
Received: from FR2P281MB2329.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:38::7) by
 BE1PPF5475DB85A.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b18::644) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.19; Sat, 13 Sep 2025 08:58:34 +0000
Received: from FR2P281MB2329.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bf0d:16fc:a18c:c423]) by FR2P281MB2329.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bf0d:16fc:a18c:c423%7]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 08:58:34 +0000
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: "safinaskar@gmail.com" <safinaskar@gmail.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "tytso@mit.edu" <tytso@mit.edu>, "linux-csky@vger.kernel.org"
	<linux-csky@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "rob@landley.net" <rob@landley.net>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"mzxreary@0pointer.de" <mzxreary@0pointer.de>, "viro@zeniv.linux.org.uk"
	<viro@zeniv.linux.org.uk>, "jack@suse.cz" <jack@suse.cz>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "axboe@kernel.dk"
	<axboe@kernel.dk>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "hch@lst.de" <hch@lst.de>,
	"thomas.weissschuh@linutronix.de" <thomas.weissschuh@linutronix.de>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org"
	<x86@kernel.org>, "kees@kernel.org" <kees@kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"hsiangkao@linux.alibaba.com" <hsiangkao@linux.alibaba.com>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>, "linux-efi@vger.kernel.org"
	<linux-efi@vger.kernel.org>, "cyphar@cyphar.com" <cyphar@cyphar.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>, "linux-m68k@lists.linux-m68k.org"
	<linux-m68k@lists.linux-m68k.org>, "monstr@monstr.eu" <monstr@monstr.eu>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "graf@amazon.com"
	<graf@amazon.com>, "brauner@kernel.org" <brauner@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"email2tema@gmail.com" <email2tema@gmail.com>, "linux-sh@vger.kernel.org"
	<linux-sh@vger.kernel.org>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "ecurtin@redhat.com" <ecurtin@redhat.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-hexagon@vger.kernel.org"
	<linux-hexagon@vger.kernel.org>, "linux-alpha@vger.kernel.org"
	<linux-alpha@vger.kernel.org>, "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"initramfs@vger.kernel.org" <initramfs@vger.kernel.org>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>,
	"thorsten.blum@linux.dev" <thorsten.blum@linux.dev>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Thread-Topic: [PATCH RESEND 00/62] initrd: remove classic initrd support
Thread-Index: AQHcJEeT2Mpw/pxzFEi5dQsRFemUDLSQ0JwA
Date: Sat, 13 Sep 2025 08:58:34 +0000
Message-ID: <1f9aee6090716db537e9911685904786b030111f.camel@cyberus-technology.de>
References: <20250913003842.41944-1-safinaskar@gmail.com>
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cyberus-technology.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB2329:EE_|BE1PPF5475DB85A:EE_
x-ms-office365-filtering-correlation-id: 90a42005-8cbb-461a-a583-08ddf2a3b8a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NEtqeWxscitYa1RhT3VCWlcwU2ZkaFpyT1prcXR2cmlhd1QwVnFDZUJoZDN3?=
 =?utf-8?B?OWh3QmZSY0xTekozdXpuVjhrdmZTcWl0bVFYOUt2NWxPY2hpakJrM1U1bE9i?=
 =?utf-8?B?YkMxUENDWDJpaitMMFRoU2Jpc2U4bGFNTHM3STVBc3BDNTQ1VnJRYmIwb1RP?=
 =?utf-8?B?UmZqWUt1SmVrbFBFZDhHWm40SEE0VEdoUCtRQ3BhdVNSV3VCNWFGRGNpR1c0?=
 =?utf-8?B?d204Sk4yREN1UWNEaUJlMVRlVXgwQ0YvSzVTbnM1TEtmNzBsNEthZjRzZFd3?=
 =?utf-8?B?R1lIaWpjdXFUOU9sWFpKb01OaEJ0eWpMcDJLZXlBdVNVSjJuVUF5cUxmOGtv?=
 =?utf-8?B?U0EzTkpFZDhkOExGRk1KdWFUamFBYUt4WDZvTEc5VXNqUVlXOTdiV3kraHFx?=
 =?utf-8?B?bGd4Rjg2dVBCbU5QeUNIU0JqcjJOYks1djMxV2JJYVY1MGxHZFliMFlEVk5Q?=
 =?utf-8?B?eHNFMWw5ekZUSkZTMzF3aGZFOU04SGw4NXBkS0FoMk5yZWIyVys1SnpnOVIw?=
 =?utf-8?B?SmV2cGZEeTVEYnRBZnBWbFlVVS9DZE1hWi84dVdQR0g4ZzZzaWtQME1NL2sy?=
 =?utf-8?B?YjRHc3NVTWN6NEs1KzhZaGZWcDQrR3dhOW8xZVVndTkyWmtZY202S3RIODJt?=
 =?utf-8?B?M0tQcjZoSXdrNkxUNFhrR0w0cDY0Zm10NkVoeG9QMHdYakUxQWZuek91czJG?=
 =?utf-8?B?N20vOVBDWDV5ZDYvYjl4VzFTOUNmMExaTjhHczJBekZua284bEl1QnlkVDFi?=
 =?utf-8?B?a0dMUnhNb0x4S1kxbUFKQmlBaHBwQmNuM3B3T2Z3THRIZXh5NjlwdkZmeFhT?=
 =?utf-8?B?dlpGQWhmS1ZXVkhYQUJMd0hjNmlQaHJYSWJ5U0l2b2hYaUk4RGlQUDNYRHNs?=
 =?utf-8?B?WC9uMlB0bk90dVB1UlBNMGhFNzh1WXMxbjVXU1FLWm5qTHBkYW94aVlrV2dQ?=
 =?utf-8?B?TEQvLzJRNTdlOGRsUEhOZlNhczB6R3JzRWM2NW1lOWduc0o2UFJURGNJeVg1?=
 =?utf-8?B?OTgrMWpXUjZvQ0ZGYVU4VEVYeDJ2dGZ4TncvVDNtbFhQaTNGLzhlZjRzbHlm?=
 =?utf-8?B?VkRsZnQvOUZiVEJ0clgzeExxMnpSZUMwUC9PTERTQXBxOXMzKzlNUUhZRGxL?=
 =?utf-8?B?am5NeUFNeFB3R3YybGtTcjhVeDNpQ2QzV3cwMkQvNk5vTFR2V0FoMDJwQjRG?=
 =?utf-8?B?VlJ4ZVBvaFA3ZkJPM3FLSzRoZE5MbEZKcW16R1kzTGtMaDhXQ2RjcElXRW5S?=
 =?utf-8?B?cGpBSllRSEFhTURpRE5GUm5yZ3V3bThsWXF5YnB5WVdRaFlmYXYvdWM2UDBx?=
 =?utf-8?B?VXNZVEpjRWczSEE2UUR4Z282aTh0aldwOE5rZDc1ano1MFBUZXRiOUxacUNJ?=
 =?utf-8?B?Q0xpQmRlWnRPV2NlRFBheWRJVWNIWXhlQmZSN1lRYUVlWUloNWxmQlBjaSt1?=
 =?utf-8?B?eHFVdGFleTE1bUo1dzA1MXhHcFhIa1E1cWo5aHNXV1RBc2laTll4UXAwYUMw?=
 =?utf-8?B?VGlUT3cyTVdJWUZPcXAyMnQzcnFFWUlHYXlTNWdUZW1uM1NJOTNiUUNzeTRJ?=
 =?utf-8?B?V3BLWkhiTnJVV1pxQXdFQ3A2VC94b2t4dW5Hazh2blE5QWphSHZ0TlFJUVcw?=
 =?utf-8?B?dGt3YTRCK3d2V3o4eHhlYWtFWTZZZUx1NlFQRnNVUEFaOWZZY25pTmdKUXEw?=
 =?utf-8?B?TUlpRkZIb0Rza1ZJTVZMck5BeStNT1dNSGZpbkVpK1FSUkRkL2t0RzlaMzhK?=
 =?utf-8?B?Z3VzVDZJT1UwamJQUzdUc3l0SnFRVVVqd3ZYeTRsQVBkbnJhVGIxbmRLMmJG?=
 =?utf-8?B?M1pBTHNvR2pyUVZZYlFVUnBYRXg2Q2tOU0IyUFJEbjZ5OEc1dS9JQnpvSm0z?=
 =?utf-8?B?RUxBanpRUFBBZ2xnWU4xUlRkVlNIR1BUR0g3S1JSUUh3NWtpbjV1T1JHU0dv?=
 =?utf-8?B?b0hCVTNpVlR3STNGMkhhZ0ZVaXo5QVE2Z0UySnpLNTNxOWZnK0I3UExPODdH?=
 =?utf-8?B?MGpzdWppYUpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB2329.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzUzRlFmTWxKQXpCMDZHbVR2NGJoT0g2NzNlUEx4OGRkWTJ2OFFaUHFKTS9X?=
 =?utf-8?B?SElIZ2o0TzkxSFlFUnlkY0VzeEk5cnVEYWZvZzQyblpFaXZlejArUDZ4N1F0?=
 =?utf-8?B?NlNsUnJiMy9Xd2Z3aTVLbGJjVFU5VG0xVTlRVXh6UFFGZFVVb29pZ2Y1bFRx?=
 =?utf-8?B?OVd4L1BsWktDRXliazkwVHpLRzhSZ0gvcURYbjE3UUE1R0hQSVFYdkcvTnl0?=
 =?utf-8?B?UjUzOUdibTdsNGlVcnJHdjU5eklTRU5jTG9HSFN1Q294R09DbXVUTjFLRmh3?=
 =?utf-8?B?T2NhQXZPbm5PQTlJQWRISlA3NmhhK1NGOU1HbVRLOFRma2tJWHVuQzczVVNI?=
 =?utf-8?B?MXJVcC9NbDdnVXV6cTFvSi9sMzhOQmFxV0pMZGsybFdqRnFYZXdPQVU1YzBo?=
 =?utf-8?B?UlpMa24ra1NsQ3d1SGxvZHIzc3NYekhQNDdQZG1BQ1ZPRHJ4SHozWEE0TGFp?=
 =?utf-8?B?em9Kb01PdlNwWmV4OW5qQVlwb2o4cVZyVEdGVXBLRmJzWWtUb1I4ekd6bWlY?=
 =?utf-8?B?UlozenNjdGZ0bU5vMVJYNDlSK1dKcFB1M1JnYjM3SU5tUDJMZ1lSTkVFZTlu?=
 =?utf-8?B?YlRya3pjUEFFTXJKT2htR25GMlZmVlM2eElzdDlYU2pWTWtTcEFieEFPTm1s?=
 =?utf-8?B?Z0txRnJtMUt1UkxObGZHTWphWnVGN2FmcitHczdpSjRURGdlakdpVU43dTZH?=
 =?utf-8?B?RGlHTG1pY1hqV0dXeWhIblhrMkNsSlFIQmx0aU9yeThjQWRuLzRFUVhjMzVR?=
 =?utf-8?B?dE9WMGNaZk9qaE84SlBKWXUwVkFKd2lPaU15UG1Gcktad1p1b3BrVHRmbU1S?=
 =?utf-8?B?d21nZy9vSHlTS2ZWNk80QVg3VmFDVmRXWm0rNW5Ja0FpL0hLTngxbmV3TUFZ?=
 =?utf-8?B?dXZqWEt1ODFoNW1WKzZoSHdsOGtMWVJzYURCWEFET2RKVHNEOVVNK2c1cm9I?=
 =?utf-8?B?QXZaQVNDSGx0VnJCclJGSDU5S1Y3M25DNENuaDVOeTJ1WTQ4bG9NQnpoeHc4?=
 =?utf-8?B?T2tBQmZzcjU5K0M3UUFmRk04WkN4TUxZcGFPQThBaFdmSHlBRFo0Wi9abXhJ?=
 =?utf-8?B?QUQydlRQYTNGRlRDdnovTGZvQUUyTXc2anlpRG91akpuUlJnSy9MbTZIUzNq?=
 =?utf-8?B?K0hQWEtUUkQ3TW9ycW5iOWM4a2xQY0QzekFRd3lLNG01OXFCTmRoZmxBL0lP?=
 =?utf-8?B?VXFwWXJ4TlBXRkoyUHlLc2pRQ2Z3VUVKZTc1TWt0VTZmaXh2Z3JlSHVzOXNr?=
 =?utf-8?B?U3JPVFZKMkpNZkt6RGlsdVJVRWFDbHhVczVjRzlyQTZmWTFGbG5VNlRCV0du?=
 =?utf-8?B?REZWNnFrYkI0a2hFZGNLSkFLY1lSNVhLSFl4aXQ3dUhiOUkyeHpYa0FIU281?=
 =?utf-8?B?VUdKS3Zha1U1dENFMVNhbEJ1cjFOMFIvTDQ1RVJsYTRQK1Q0SGg3eHJLcUpS?=
 =?utf-8?B?ektYSTJLQ3RnVy9wMFlWK291QWt3V2U5WG1jMFlWR3ZicmtjVzB3eGU3QTBh?=
 =?utf-8?B?SnduQzhIRnRsVE02cHZjZ3JXc3JCSDF6NWdVSWZ6bkluRXFMN3VxTytnZXBv?=
 =?utf-8?B?am5Qc3JTeFRhN0tKQm83T3BsckljR1hYc2hiLzJ1c3NMT3hONjRFdkFXSmN0?=
 =?utf-8?B?TFZ4LzEybUt6bm1wWWI0RFdiMlMyUXZtRktTUjFsQzNFbzdqbXNQNENJcTBK?=
 =?utf-8?B?VHduZ0JUSmJNZ2R6QXprN3lOVnFxOWVObVZtSEU2MmhxVGl0NlRGL2ZtU29k?=
 =?utf-8?B?S3BqTm1UQnVjYUI4OExTMWI5N1o1V1AxZXNtaU9hRWo3aWdXNDdpS28zVGdr?=
 =?utf-8?B?bzFydjFrTUFvU3grejVBY3VVZkhuWVN0QkVYQlpaelRKaGlwNEJ5ZG1ocURi?=
 =?utf-8?B?U3NwMjhoeEgybkxLYWtGWTU4eXJqV25mUVE4eHUyQStnRWxwVlNYdEh5Y3l1?=
 =?utf-8?B?TmExc2lnM2xXYjBtRlVxSHFXT2dwYXNVMklCbGtZQnc1eWQ4c2NBaGY2TE5H?=
 =?utf-8?B?SmZrL3Y4cVB3aG5Kd01ybEZJNk5ENHAzNUl6UGVzZ1VEMXFnaEgwQUJMcmdO?=
 =?utf-8?B?K1VyNnNKaUN6YmMzYkFpOWVkVUdzWXVmdWdUUWRpaFBHYWtvOTBJSUdaMi9Z?=
 =?utf-8?B?QnFRL0xQQXUvZUEzYkdVTEhXa2JpUE1lS1JoUWNRVVlUU2haYndiMjVDbjZ6?=
 =?utf-8?Q?nTUtMQqogJuNvRWJU3SGGumdm6VWCjbZO0z4EjSXdgSR?=
Content-ID: <CE82B6496E16714F9F4AF9BA1CEEFB91@DEUP281.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: cyberus-technology.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB2329.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a42005-8cbb-461a-a583-08ddf2a3b8a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2025 08:58:34.7227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f4e0f4e0-9d68-4bd6-a95b-0cba36dbac2e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TApQElCG/9VYp7xZZBuNrg6KUgdNp8YPpXIs6shYbTWilwooEJ2zXSgpXo2d5f4wqv0KdbBJx8BSvGGknZaQeD0gAkKNGSj0Mk9sP2QQQUGYu3WbaY8lw8J1sUs89vpM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1PPF5475DB85A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_015845_763990_D6573100 
X-CRM114-Status: GOOD (  14.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, 2025-09-13 at 00:37 +0000, Askar Safin wrote:
> Intro
> ====
> This patchset removes classic initrd (initial RAM disk) support,
> which was deprecated in 2020.
> Initramfs still stays, and RAM disk itself (brd) still stays, too.
> init/do_mounts* and init/*initramfs* are listed in VFS entry in
> MAINTAINERS, so I think this patchset should go through VFS tree.
> This patchset touchs every subdirectory in arch/, so I tested it
> on 8 (!!!) archs in Qemu (see details below).
> Warning: this patchset renames CONFIG_BLK_DEV_INITRD (!!!) to CONFIG_INITRAMFS
> and CONFIG_RD_* to CONFIG_INITRAMFS_DECOMPRESS_* (for example,
> CONFIG_RD_GZIP to CONFIG_INITRAMFS_DECOMPRESS_GZIP).
> If you still use initrd, see below for workaround.
> 

As the person who kicked this off by trying to get erofs support for initrds:
You have all my support for nuking so much legacy code! I'm all for removing
historical baggage even if it comes with slight inconveniences for fringe
usecase users (me!).

If this series goes through, I'll drink a beer to you!

Acked-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>

> 
> Also I renamed CONFIG_BLK_DEV_INITRD (which became total misnomer)
> to CONFIG_INITRAMFS. And CONFIG_RD_* to CONFIG_INITRAMFS_DECOMPRESS_*.
> This will break all configs out there (update your configs!).

This is beautiful. The original names were pretty misleading!

> Workaround
> ====
> If "retain_initrd" is passed to kernel, then initramfs/initrd,
> passed by bootloader, is retained and becomes available after boot
> as read-only magic file /sys/firmware/initrd [3].

This is pretty neat, because now you can use _all filesystems_ as initrds. :-D
This solves my original problem, albeit with a tiny shim initramfs. Nice!


Julian
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
