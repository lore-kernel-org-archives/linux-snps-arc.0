Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63A0C63797
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Jan 2023 12:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJ3nO3xaERc0eSU89CTOoKElLrr3D775WCPlMmoLHmA=; b=a8B7luEr5ctPNh
	c28XWcNdJHRAoH3YX5BmXnLrzvj1oDNwDR6pe35PgeNZBspnku/6nbBBzxvfmRsm5np7b4st3ZB//
	u2cdmUM+wvQarPtPxWpPyTY6l/1iD9CQ6+7AuxQC1/HutvbCC/nnsRt4MCaLb3/2NxsP96t82o0xN
	lUYp9xvlqeUfsNROvbMsoj4jFIcywFTVkMMkN0xxPKxZ7zBICSG7xcBpOJLx4icdML0dM4emKreN2
	QE6ARnV0S/s391Z+r4Clnq03EVh7qHpbiv6dhNtV06q9rgUmKLiE+ra72700Ir9chQjPXZ6amJFZ8
	pcDkjk2rTpcnGtXgDlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHl80-00EB2L-Fb; Tue, 17 Jan 2023 12:31:48 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHl7w-00EB1l-49
	for linux-snps-arc@lists.infradead.org; Tue, 17 Jan 2023 12:31:45 +0000
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H7NGNP028374;
	Tue, 17 Jan 2023 04:31:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=CE3g2lw1QJip+AqdB61NTJbk6BiK5nlAnvLPEAp3dA0=;
 b=JBy2EVW2uOYQ9b3iCNJeTpnjd+k2Tt5XuOzK6TUWO83bKVoO6vLgkJ97Sk/K3TWL2JO9
 ipbBI4JSJ04Q4WNqzdqUxbGs9HU4J24zEmTqmQYHsj+z6JlIVXNfSHN4t/HCK1BBl1b4
 AkBDGtwl5F5xoRW8tDkQsTRQTkOsNRM5YoxCwQ0iBBRrKd3tfqpm53CKcTg9u2JHt7vC
 ASm0AqC1l3J/eir9/Md1+nUfbnVRWwA2KpwUsK99Suiae1jhpHKLISgdMU/LPmedarE8
 vwNY5VpzyDArD4hZ6m7b8/zEYitSgDALrlaBPnq2L2pEUwMr5Emy7zAbGNixAFCjZhtB fA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3n3uwm6rpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jan 2023 04:31:42 -0800
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8DC3A4007B;
	Tue, 17 Jan 2023 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1673958701; bh=CE3g2lw1QJip+AqdB61NTJbk6BiK5nlAnvLPEAp3dA0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FwP5mXAgg5Dj2/nNi1CggyP3dJAp1703fA5N8PlFmzqDnT3SXBKTbMCaXLIxWi3Nr
	 h+QPE7PdcieO/bzks18OuJoFeFVpjMglUs9ljiaeDlgXxbfARIzu+mwS2CS3fvPiWN
	 zQcxkKYRWmu0IbK4Ohyyo07UOWluKF+sqNU6kjDKplz21zuX+XnVKWhxmRdHVMU10C
	 GaziGKEg16bIBfjSbYqklebeemG6h9kEtHC237ndvVgqxRh0ZUjLXPsZ/XJhWZzH9W
	 jiZQY7Wkise6HY9ojIAFJBThgpHDxN3KwBg3EF69DAt6C4LtzMH6x5tANiyiorxCyg
	 HbCngeGlVh5Yg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E4756A005A;
	Tue, 17 Jan 2023 12:31:38 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9EC6184306;
	Tue, 17 Jan 2023 12:31:36 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=kozlov@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ve5J15OX";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grQhU4DwUYyKsMJsgB87SakFaHO48LRwH6Ov4OXOpWOmZ11RChSvsVXYy1qvH0ZDc3ZIw93OhsXNypojt8/K9WGWm/A2JzUYCLYaXm7U5vbid1hAhSlAykqKxfDvh5YGjFbMgxs1q/Ae/T3nStsd++2Wv4Xo8EUxM8rWc5JvatFEoYAXkkEnTxzW/zqBQ0cgNi4gj0YWZ8ZRej2F+Y6UElhE3Io4Hs93EAt2hlqRKCULLI6QK8a5KV7FtpIjpiHIOkxfduNtacCYZU+569pHp0Wz+X8mAjZWeFwZovhKPxQst3bnzOwHvzxtn78/BrbqE0ILsyCAUKCxfLZNT8uO/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE3g2lw1QJip+AqdB61NTJbk6BiK5nlAnvLPEAp3dA0=;
 b=Z4qiGmFUuAnMunJlUmter1ullNjC/pGoqSNpEZVm4ufVzhRO2bYP2vubRTqnQ9MPSMzkuSsGsEWqnE7xXvlWPHayNzdE2oetJbF/a3ewArF1Yl5q3SSbuPJDDSUSkInJEYmPfyfi3ZI4wS+aAXBJoA2LDrFG7Y/HtKNT4thrdTagWsEgpoaQd/7xA2JQWfMTxQkB+7WZd5WMYw1OE9QZ2uUpOAmqiRMCrqYqOB3wTSlJj8Kl7vjWyHvvGoOWn/lDLfaNqD1hoC0w2lhJ9gosMcgJDKFnfIqkODKoLYIDhE+Kreff1CFwZfc7X/18WqWudUrvpNbTugpQtKG3EJJh0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE3g2lw1QJip+AqdB61NTJbk6BiK5nlAnvLPEAp3dA0=;
 b=ve5J15OX5nILWDHQoFs3ZM3AlIUwpTAc9dH822Acs2BLYj3ZPsPojHhQvNZfQ7PjFdsgu6MmpR5gs+Ohta5FH9KN3q2ajBwML2mJ+QYpnAGqiT4tLGlVP5v0bEUf2sLc/XeXzPnn+JpZxahU1Lk18HG0UCxzmv857Gbf+JKVEZc=
Received: from DM6PR12MB3146.namprd12.prod.outlook.com (2603:10b6:5:11b::13)
 by MW4PR12MB7030.namprd12.prod.outlook.com (2603:10b6:303:20a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.22; Tue, 17 Jan
 2023 12:31:33 +0000
Received: from DM6PR12MB3146.namprd12.prod.outlook.com
 ([fe80::83c1:317c:38bd:9640]) by DM6PR12MB3146.namprd12.prod.outlook.com
 ([fe80::83c1:317c:38bd:9640%7]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 12:31:33 +0000
X-SNPS-Relay: synopsys.com
From: Pavel Kozlov <Pavel.Kozlov@synopsys.com>
To: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] ARC:fpu: add extra capability check before use of sqrt
 and fma builtins
Thread-Topic: [PATCH] ARC:fpu: add extra capability check before use of sqrt
 and fma builtins
Thread-Index: AQHZFVlYfqlRBtP8KkSDx/6Tijucba6hQBeAgAFJAao=
Date: Tue, 17 Jan 2023 12:31:32 +0000
Message-ID:  <DM6PR12MB31461EF7FAE0DE7A4E7C587BBCC69@DM6PR12MB3146.namprd12.prod.outlook.com>
References: <20221221162849.12301-1-kozlov@synopsys.com>
 <882721d2-adb1-1cbd-cd06-d7902dc9d2e7@linaro.org>
In-Reply-To: <882721d2-adb1-1cbd-cd06-d7902dc9d2e7@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB3146:EE_|MW4PR12MB7030:EE_
x-ms-office365-filtering-correlation-id: bea6a4f0-4472-400e-b441-08daf886c45e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MguWvmdddfG46kHkzRYVZ0ua4Vgr0sHN69PCiKl0pEiX7zsfEdrXIvMbG6l9hrlIbNu0/g7VbfQ7729IQ66gQPs/7vO5IwiCEoxGLSELvsh6q4s6viHy00H+O9MPP3XkT3hS+jepEKwrqPV3Ipx7hMUwXzwUkZ6dhcbzCzPcLowb0oGW45ZMYd4rDsb83p1frVUo/9ruyqRDC42Q3SkXh2LFlHKjjOp8gBXAmX7ZtxnvV0ywNe+F+V9PfR2Y1QQnQbOLfffGUPRcuBQO4X2fhXIIjKaTOfRAQ1QKiLe6QvR3KLvv3L5xRzQBstNbgSvccoynzIwwaRstPMX3yewqDcL01M8la7XAg6OuzqKGtRowA7Znc6y2+eSxhBW+wboy/WGvApBUBUqD+7t97ja0ky1y7RLf1UNtTy0WQm/0xEZeLOmheohTbH+49JCPuweKNV2XGYMAaQiK6EOMPLGBwUs/opU21NfqOrxLeTjWCEDuhJWX/ZjF6hlqvCA2tIFGVjPkJppI+HUyo6c38NjgS2OYq4/xEoqUcVj//NluacS5g6ZVIwT9OoQugWpvyxwEj57FCEoMlIJDAIYEkRq7Q4jksR3XeG6QkdCRHrDNtfeCpx1r7M9wcBAafs/+7qoSTDx/T6xF0BJFaB8R26oqr5VmDCpg3SlsE5O6q5lhxK2cNnRYDgP+Y+OTP2CeatJDR6tk3zft9/kEfiXTcemUU5LrxR9OlC6+AvpyBsapJ6Q=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3146.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199015)(110136005)(316002)(71200400001)(33656002)(41300700001)(66476007)(8676002)(4744005)(66446008)(64756008)(66556008)(4326008)(76116006)(86362001)(83380400001)(91956017)(66946007)(38100700002)(38070700005)(122000001)(478600001)(966005)(26005)(7696005)(9686003)(55016003)(6506007)(186003)(52536014)(2906002)(8936002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?m4m2Ceo5uc65iBvVU+MZ6RfbKQHDpFQjcz5nWe2Z4pp8tFHZHbFhLkMZBR?=
 =?iso-8859-1?Q?UYRiUjBRfuahGq6RHZ/6kYnjd4C99Omkyz4zf2euf65uqQfTWZNliwUZCp?=
 =?iso-8859-1?Q?2wSfWz0AsfPYIWnfYkDzNOBSlVbM3HbzM4H8zQ2c5A5CHo3MDlDOR8UO2L?=
 =?iso-8859-1?Q?8zBmSrbtnZnV2rV53Fyzlcxh4DVEXJE1SKRDdDqqFitNB9llX74/FDVdDj?=
 =?iso-8859-1?Q?9I6q1lCv1cXZMk5CUvQjPNVq53OSJGR65pCKsj96/r1GgHM8IvEH8y4FCc?=
 =?iso-8859-1?Q?kRhNqNOMcksXZqpS5h7o6kaiRqTI8YJfmb4szwWUVPH8CLvSXOBObc/O8b?=
 =?iso-8859-1?Q?IQ7u7GzAzubEiBYkOcpg37vXbqc7Kg9Q36B8Pcf3or4LcZ/i+nqj4p5ijy?=
 =?iso-8859-1?Q?u3ATWBYpB1TJM8VHRQSMv0DY2KbY9DCccmRFM7lpAQD25p6ofd9vK4J+TT?=
 =?iso-8859-1?Q?7FORCEPFgA1QwAUC79+l5T8UCHiMuU/2Ovz90mAYm2QP+3n68bNJAzSgZ7?=
 =?iso-8859-1?Q?kbyP5BO/MSJz/fCdJtTGkrGfg5ZO9hf2GWadU6mUU9dyT7ejyWVUCuQCNJ?=
 =?iso-8859-1?Q?LBaRwfprG1RCKVGM0ieuYtjzjiuqKxJT7aH6H0JTDLfLCHC8p5e7OnmqHg?=
 =?iso-8859-1?Q?OM2zx1AjfijYiXmlZHqblnRn6vSWJ/C5QfnLQrKTvoF2DRtlEY53+JCVkx?=
 =?iso-8859-1?Q?JLKF2YKQw0X1Yx9qwb9Z0sHuVeWZG7JV0XuTQLp0F5Iw9U/quuEPbq2mBE?=
 =?iso-8859-1?Q?y57k9PB0sLBZUNFBfb4MtCAqPNjc6GdR8xjs1K8bQUJbOpK0t3eQ/xNsGg?=
 =?iso-8859-1?Q?uF4wNjiq41K1p91GC6D6rBR//AW28gX5WdHeCZHY+UWvvXud+HYtV60Xwq?=
 =?iso-8859-1?Q?DEhIkYkXfx6xbz6ECgm/o/JMAapjOUHjo3s133yWuGKCSkP8Rq6pPKYVCW?=
 =?iso-8859-1?Q?j6tKFGM7l/rqDYLtk1V2eMqKI8nR419IzNP9ASsE5bXfDpDOcDleRGzm96?=
 =?iso-8859-1?Q?/B0cxry26Dl0Mg72wxuJx3eu/vTQcYTAVi2WT79TzPlmm0ysYB5tDQvlU6?=
 =?iso-8859-1?Q?Ro8J58Wsfu/Z8Vy+8qhoTL92kjMutSRY64KQhyTwAug7o2wjfoHZKb9fLl?=
 =?iso-8859-1?Q?iUkcnCT6cVUqNiUO6+3XusFtmnCBVcaTcF3Z6JjQb79qv/VQXWoO/H+908?=
 =?iso-8859-1?Q?v+CwfCY9gMFYegvVj57KKZ7U5RpqA7wYuGOpvlmYWlECi9y5dwBDrljCBe?=
 =?iso-8859-1?Q?fBxBhPkBUgHoaQKZrEBETf44nROj1qafvNMEsfeBQNhWCbHS0TTMHgJ0Fg?=
 =?iso-8859-1?Q?U0IH6lFwIn1yzMrRlk6aRVG5CwNye+kqvO6yeccvGBl6cwyYP0Jf8SYbzy?=
 =?iso-8859-1?Q?TbXul0ZpHLSDbheVay7HZl+ehfZJgCrT91pQmQJGFf/PzJgit3vJSPf4AO?=
 =?iso-8859-1?Q?Meipg5wjHUKGUdKCH4wlaI/K6SR8gWbrAU2dHrqr80eTHZ5o1WQ++X8ALf?=
 =?iso-8859-1?Q?ALc6dExmkp5x4y+uafMur4RIQ9iyymkqiGWO5q4Ag7AMZV31RtNLTKpTqD?=
 =?iso-8859-1?Q?yr4A/KJJM5oJAXDjibFjPofcP6rn9/DsPWw6o2P8oosjylSekIxJrHdsfb?=
 =?iso-8859-1?Q?5MGv1ZuEHGtI+t6c71n1AUoVvOS7soCKep?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	Y7sQ0u5OD41QYnVAC2X0VWrDiURhwaYDauJ8m41Eza8+7PBketgSDvX9AE+USarTBAZoT0BNHYR6e3jqmySBKFnzN+/5gS8wWp8UoNHn7IP2ZoXzHQT1Hxq0Rdc8YZgHIRDZKnVmk5mH6D/JbmIMQ7QEjV7Kd2zDTE6p/kvR5xj0Sdz0GV6bxv06FJ0f71GXF3TOXZi5J4jfP24ErapEhgNeGfTO/VfKN5lumtowWQkjWXVzUNnm9VJXqF93jokS3Ew1vVZplRfJw8X/B8hx4sghUd+iESWoef7u4hliCrezNdn9UW+HzJEsWy3BkPrE5w0zGDFxl3IwOHek64lVZ5VjK9fFB00aW8kDvTvkcmZFD/9KdcXlqH483C0SxAYnqZm475h4KYLU5WQuC6aDEsKcdFaHbhz7ASyEwDvxJIP6seIjNEkahi+rbHo4MaaTDHocxi3i1RAKBsl4mfIJ8wHY1v3W10Wt8uN/ZY8bahoRJt+FLK/d7xi/5DqSDHYkYOL/SoFoRXGgYyjvoS6ePbkFct86zRVgzrxXcK5FJuwvclWnO671Djy43lB197n08L7bupMn3lYNvvJlHdb6c7dEiImYoaBeMncBw8R3kGOmMc6tyFr92yWbwAicidOb3YxucD8qfKhCUtDnDLy+RaleRcos1m8MyXyOm5vBdTOWHUu0uj+XczJYnNzHu9uqprVLpB0hwKZeKNV80Z1xe/Xr2B4ioMj7uPDDcLD/s0U9o3soXCRrVixSO+VLtlweXIO7k27SlautUAkai/ugscqbODJMVy28t1DuDvGP9VRPX5F6d2jRbYF48YzK+VswwL1yLw9wpEliAfY7Uz63XGqR4pl1IqIc9N4QatseIawljsvl4lwKPY9Sa7I/VzAA
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea6a4f0-4472-400e-b441-08daf886c45e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 12:31:32.9724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGCHFuebNYENyWDzKzNxsvMV/R9s8erqCAixV0tYVDHFym79fOMtTrn1AebegI1m8xW55et4TFZjzWEvJt2FgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7030
X-Proofpoint-ORIG-GUID: MXM3wOxpw7RZmfGPkkx6bRY_2-gTlLEE
X-Proofpoint-GUID: MXM3wOxpw7RZmfGPkkx6bRY_2-gTlLEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_05,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=622 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301170103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_043144_577599_8EDB87EB 
X-CRM114-Status: GOOD (  12.67  )
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

> This is wrong, sqrt use macro do not belong for the fma switch file.

Thank you for the review and your notice. I was inattentive when 
moving changes from the branch I had. This has been fixed in
v2 of the patch [1].
I've manually checked (by objdump -d output review) that now 
expected code for libm is generated in different cases (when compiler 
provides support for extra instructions and sets macroses 
__ARC_FPU_DP_DIV__, __ARC_FPU_SP_DIV__, __ARC_FPU_DP_FMA__, 
__ARC_FPU_SP_FMA__ and when not).

[1]
http://lists.infradead.org/pipermail/linux-snps-arc/2023-January/006771.html

--
Pavel


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
