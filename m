Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC04C61DA3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Feb 2023 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YclRIyoHmXsvOyeurmRD6BWAZp2soyBoL394EOm7YMc=; b=Jm1uPg1UXDujjB
	m/qFNloFSwTFnrOzIEwsroYd0q2nVfFBMMnS/4hNZ4pHbIbCIdht+nVM/Q5FMldPN2lw2SUz0PYt0
	rhv+D2/9tiTYi9qIdyq+mVj2kajdrdQqv89gdezGFWKD76emTQpXlyhDHCU/QQJnQh08L0cFDzV+G
	yNGB0YQqwU2P3CZgyLWLIIxBj4s5lOv+dMBJTVw8Ihsuw8p0ggECzLlQnThYe5nHyaV7ow/PEpUOW
	07h0eQjRioCnVC+sKmldl6ipYH8pFDvi/zOgKOjerpJqrt6tv8eak1DSgGuZcVbdSyl1iGvCPwoFv
	ItsDv/+g2zR+w1qGPV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUT7X-008O4Y-6I; Tue, 21 Feb 2023 13:55:51 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUT7U-008O3g-Hj
	for linux-snps-arc@lists.infradead.org; Tue, 21 Feb 2023 13:55:49 +0000
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LDTs1T012240;
	Tue, 21 Feb 2023 05:55:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pfptdkimsnps;
 bh=IRnP36BihsD/vxqo8gFBQrtIS35O/u4i2GKG5OMnnlU=;
 b=cKodZ1AGrzQynHGZj8IZHlM6Cca+GYXXORGWZjOjtz08m54VdwC5TPd+DinU8BxCR8E3
 ROaKqPxg641Lbtku9AaWps47xeAiHh1WnJ/oQxYnbpxnS3tbxJfCFyaHIge9NGT01yua
 tBncP7qzjDQbFpe2J5hgP/maPKZxrKl/dF8+Bic5l0YcGcjevmDQtwwmxyclT5TzGLK4
 krc1bul/0XXvSYOXyev/J9XxYXBsmwgR+1cn5lw+IIQGVGiAZ7XGkqKMuNyow0gbrZJ/
 gq4WkPN1b+pq6gX3CSP+1EZcNJ6m9tugiPtqn+gHgoRgi51KCHbj+vLAMPRonYDP+LHP IA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ntxjtpj32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Feb 2023 05:55:43 -0800
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 426D1400E1;
	Tue, 21 Feb 2023 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1676987743; bh=IRnP36BihsD/vxqo8gFBQrtIS35O/u4i2GKG5OMnnlU=;
	h=From:To:CC:Subject:Date:From;
	b=C6rmdtWzhP7Z/xdW136K/iwWCxa6sLmh7NW/27O9KrUJCjLjcT6tcL7/kPPpYAaX2
	 aQgw5qrWsL3bLErUxhTxdoC/tn39SmzdlSN16tb6rAZQZIc/AGJAaUi4wnYlEVDRCL
	 gKXpa+7wQ/Cg7lOOxgFQsluh2e7OkrXJU5zIBtgXH6/W49M1751E9P8KRfPZIJBZqO
	 N+TDgUmeLsRF8cLp0ILEGYCm+itgfS203Glb2I8DyekgG3cOIWrC7V4+tz/sanUuTf
	 1Tfzuy7ZLPBlRX2Sjx4lSUxNnVfJjh9hzZogFLZwUUt13YDsSKrs1Odo3xqW6kXwa/
	 XhXsGjLH4wCLg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B4651A005E;
	Tue, 21 Feb 2023 13:55:39 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0C8CA40042;
	Tue, 21 Feb 2023 13:55:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=kozlov@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="POywIYNM";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipcppbPD3crkt297adG2O9lhr+qYj/MUh5DJeqDOd6fmsUPEVnZ8NKzLahmpmPpaJMOLjwMoXxcZFxvIdZdwclpsEgQZJeVOr78yLlVx9749f987SlOcJfqkw+I1xLkpSmI0rHiw0pi6A2K11b2BgX7fWbIPdIkZ6pU1AHIaAhKBM2/Unh9zWPx+wrncoHPXZURjRN3J9CF0i0LxqRNpwDwQdD8jWZXGouqdtzQ+8XxBrTDBXq6WCv3eGOk5MVKQmhN8JauW0Wl6PH9EjAyNmSt/kCOpwdg6N9DzRohHB9HCxgU9Xp/TNd8LVGi6YUwxPkfP3wi6epffGQelJX9Mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRnP36BihsD/vxqo8gFBQrtIS35O/u4i2GKG5OMnnlU=;
 b=Wn2T4sbALdeBT2Hqb79Jt2FlNYTSC0/UHzKJABKzyXy5sOsTm6sFYVsLsoA53OXRajS0YrRbJLsPfRm72KbbAEkgcwBnxB2Oct5Rfplsi9uNXp+AVDTPMNQML4ib0gROj+wf2YEiNAmORaBVqpq9CtHsdeejqmfBerkv7qfRKGlgRwAMweRM0XzxuO5MX29QdKCpKes9mKfwMOYPtq03JbowDLOAIBEa11PVmVGPSS45nCeRZclz7ycCWnGJZhMBEbqPpsBA4/nzAGqINq1uqcAgUa9yWk+9o2CC3kcgxm1P5DLC0jXJcKcLJTLTov3p37jzS/2xEYIkZDSd0a/PkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRnP36BihsD/vxqo8gFBQrtIS35O/u4i2GKG5OMnnlU=;
 b=POywIYNMouzPYKpXYk8Ht+HZkR2aQo2HRTlRQlY9YuW2NH/Iww2oT2H+UHPT9hpf/ItV9eyQjqLgizb/d/LerYksJi9IN0zbZN5TLu/BHcqYdpy01qBatd9ETJZqN4jHEQNvAeRggjx5x48cJEbp91pEc/na1sQ3NN8cAhGsMVU=
Received: from DM6PR12MB3146.namprd12.prod.outlook.com (2603:10b6:5:11b::13)
 by SA1PR12MB7125.namprd12.prod.outlook.com (2603:10b6:806:29f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Tue, 21 Feb
 2023 13:55:32 +0000
Received: from DM6PR12MB3146.namprd12.prod.outlook.com
 ([fe80::dd2a:5bcf:8b1:b1a4]) by DM6PR12MB3146.namprd12.prod.outlook.com
 ([fe80::dd2a:5bcf:8b1:b1a4%5]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 13:55:32 +0000
X-SNPS-Relay: synopsys.com
From: Pavel Kozlov <Pavel.Kozlov@synopsys.com>
To: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
        Vineet Gupta <vineet.gupta@linux.dev>
Subject: Pavel new maintainer of ARC port
Thread-Topic: Pavel new maintainer of ARC port
Thread-Index: AQHZRc8efxNjI6OBK0iulJONp05m1g==
Date: Tue, 21 Feb 2023 13:55:32 +0000
Message-ID:  <DM6PR12MB3146B975395D8A9BC4B13F3FBCA59@DM6PR12MB3146.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB3146:EE_|SA1PR12MB7125:EE_
x-ms-office365-filtering-correlation-id: 443817d5-5dca-4046-6218-08db14134c95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Jgt+3FhZ6FDegj4DcTkf5loLTL1TH8Qlv2I+8+cI+3x8aFTVLpvsIRJrph3VyMcKF6E2DvS+cUlFKLjWQhkWNY7LbbVCMLayDWHa9St2UQM4I8ZdBe5hoTyRTUNx9I/PatPp8PtFxZmDRcu0pT790K4nx9DMRFSd6J7dhMc7Ok1A2g6MbRdFXHn41n9qRA1LNHu3vGQIEyii4AUeE7UOGa82y0T1mVZJ9Zev0uj5l7gwVAounJpMPH8K0mXz9X2b0qBrT+ZkfZpd6pAE0n/a1PyIJx0OR7SSwRTbospP+3YoCiCEb0Jw4i6AIJx/p/Zm8b7hhHdV7B0p8JPUTWCraLbmabyA7uRamCLSKq1VmOmGn7U7wxvzB/uJ6+VKhDg+6lXYPYefMjfTJne9fKZgMUNIFc1QckrtvXPLVnEOc2ovkqQOdaB6Cc1A/IkNIIEu92F3BlFiYyKl7PwMgfslJYU5e0nAkO9HBifi0MH3hqxg6YY2E+/fRkH8bC9NSDbqddTYkUbpezNP//jcP/bziW9hdy61NRCKuVoKRPjcSzsZM+A7WRWmH9o4MWiqAZDNoSBCwtzjkNPAcVcPPQVjN7PtVdksDI0IcGHZBMoADJcxfLADKh+csRjow4BKA9iEmQ9pQYjMaTVQrQEmXn9cKlelgEx+o/1z+OqMWvXULF6qN1lDFz3xraEuyHjrieTHIcPjuAwdJgV2qyifVp9Qkw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3146.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199018)(38100700002)(478600001)(122000001)(41300700001)(76116006)(91956017)(6916009)(4326008)(8676002)(66476007)(66446008)(64756008)(5660300002)(54906003)(316002)(33656002)(66556008)(86362001)(83380400001)(4744005)(8936002)(66946007)(52536014)(38070700005)(2906002)(55016003)(71200400001)(7696005)(9686003)(26005)(186003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?8hFrhuaxY8iuOoi2X5D85jKt1jgCmz5Sg4fPv4V+HGSmQJs2FWUlEBEqqC?=
 =?iso-8859-1?Q?AdZlBczrE9IAYItuBNhQeIFaq3StDxG1UnymuRAE1qglbp+UwN3fcVxDtn?=
 =?iso-8859-1?Q?3KVRIaalrZaZ/6Guj9sZx/a9HTZ1K4BRQeuc9RBtO1DJvMC2L3oJkwHI/1?=
 =?iso-8859-1?Q?WSCKO1aTJhinWmvNr5zXghmmeT530gzmSbkjJHGQ0weNWmBgvJVg/WZBAH?=
 =?iso-8859-1?Q?BkoDSdDJ9mTysSM89xvEp4WtTHvVQZ1wPV/nXM9G7h0pT5lhy8DZRyudqc?=
 =?iso-8859-1?Q?pMKndcGXyiDv8lWo3K8xvHuchBdZ7uJDgJMd+nYU24n0ihDnIocB3KjsiJ?=
 =?iso-8859-1?Q?2TL1juo2Z0n5khspf7CwC7LAmHv42/9yxiVgY0SXFYi9c21/GiFG9IFA1q?=
 =?iso-8859-1?Q?tt3bJetrjR6vGYRoiWqfwqM8+EEaFy7HpupZ0YVwvDwDC2ZUYDBMwL3amu?=
 =?iso-8859-1?Q?9XGyNgYI6IoUjUsDuVjchUk/gzDYYnlA2hXtQuY/XyvVwFLtqUbjI3Yfjh?=
 =?iso-8859-1?Q?5p37Bzwk9g2AEP43D1rDlbBb/2CFR37c/VnRa1SRyGoUcX3qBLRyTsy0yN?=
 =?iso-8859-1?Q?7za7yrj8+EtsNWapUrMBtOorkCcIWUkCWazp7MFQPc5sK74fg6fssDkExa?=
 =?iso-8859-1?Q?P9Vp/JVIoDLxoiLw6l3K4Re2zYktxlvIlmwROOOqHC/FAby5J17QbbsnXV?=
 =?iso-8859-1?Q?MleFq+9FDYQwgy9DzeW1676GhVQLQ1lvQoNG43fHLFaxUEo+OMlhLVvbC+?=
 =?iso-8859-1?Q?TtsdKH16MMHkt54gaUN2qpTl3N1O8YlRGHmnbr2AfeX7AKxQjyG4uU4Ow5?=
 =?iso-8859-1?Q?QH895duDWA/lYn9cJr8Wn6BgsdxR9OoYMoCbYp76fvJWwoNADFwB10tA2u?=
 =?iso-8859-1?Q?QwnUeNFtQ+X7JwM+9fiGscAquYeZvXd/a6Yw1IacqSJQ+nma9rmnrKwLJ5?=
 =?iso-8859-1?Q?e9saJdPrVlFgvTDgCMe03RqbRj47eYluzDc70FZJXzUBcq5YuS98UnaIi+?=
 =?iso-8859-1?Q?O+XSkMy2QQMnI5xBdtIw6Exe6BmZ92gCLU9vq0cCnJ6Fqm31YrxjeMz5NV?=
 =?iso-8859-1?Q?nqDKzai5eDynDZmlAzDocqL/7of84Nv6EPp6KpuGNUkvzZ2AqoM1m4MLRL?=
 =?iso-8859-1?Q?76+eeQPRkeZs17Lbt3lYk1c81S+LoGFHa6G2ot3ZZx7oCc9uz5jNW1Cd1c?=
 =?iso-8859-1?Q?e03Qx4YqvBcjmjZrXm/5DuAxDoqQ9BQLJJcIHxGnFurtsQbN6kk/qUzKdY?=
 =?iso-8859-1?Q?XCu8m/eqtuHPrVsjZkhVq4kuF0Xm0VkTaIezULzZsxo8JWP8+8A2Udhe9P?=
 =?iso-8859-1?Q?so8EtsZrKN4nSiuZ0JmSof9cNtK6zlgkf4jxB8qrGC2uhTWFyjshWAyMH1?=
 =?iso-8859-1?Q?31aWxbZdWaCIJEK3D6U7C7DIw0SpdgxQYMJpuWQDjJpxYAODmIUmoiFXR1?=
 =?iso-8859-1?Q?UqZNs/JRv3Xwy6L8tukAWeoiNIH8mCJ1A5ti2PNZWV/vswxgDLZSK7J0pE?=
 =?iso-8859-1?Q?P3TPRqmSTFRoiuw10vcnz24lYtthr3Pm+PCnqIxCGz5y0rv2dDLNxzuQmp?=
 =?iso-8859-1?Q?k/JVgmoTFJS26ymMLaP2RI++gTgPMFWr8DhFmdcm0QR0QlHqxBsYamvHf1?=
 =?iso-8859-1?Q?VjgWIfuJhpbIRLtX9WI3qte8oLbYGKlH/r?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	q5qaQxrUO8f3XqyRuR5XvxNKvUklJSnN005d/QPNrHKJtglbVdpQ0dC1F8Ye5VxCIybnIS5DJhTAgEIe4Yx1HW10mfzTIpD8nPFKueDTMrgNdXHPya2Upkcq8KInMm4y6ucYLuINEIq98rJnC2JcqtxUqnyi5oqAMsrnGATB+9fMT1VIkMFzYYuR3MXwOS1ecyUufjV46cSosoLdujpQn1bl5qkOP4/AC/embpuGPPZOK+5r69D9qey69EW+CL/tC8PBJ18coF/sxQqlp028FNwXp41GlmLHICEo+6sUv9HcprhKWbDadqJU1OTid7bfChw+RleUeCgX0HyKs3/eP05zQ9En+fT1pVDJnMKuN3csEtlzPs2Y7oAAUKG5ewfMO9B+CJJt38S0544HUf4G9LCwIUOP8iggWvZmFvQaAp0Q8fbc3dtGTHFVPiijCVRnBVx89jVcuQmCPK24MaGfEzvW0hVVu+IlH0YlKZfxnhTCYKfmWoD22kf8YA5xycx9l+OQidA43DI7qMQnMdDdRgRpzk4Ha2kqhvzVtUZOAsfYW1L1jqLoIcKZSViFAcSNyFDQON9NoX20W6f1jk4t1ez/6Cu3BiG79z91BnaasPtx/YQldoizV+OkYa1QAOcXDl7sCudsuqprZDgrHu/SuPkNFOVYnc6HYNhkCFbz1JmmjR28gFhfOUfSZOsKOEB7/WhQB6TwMSF2boTaq+QEsjv2B0C2QFqcU+8ywkE8MnVDWJR/iQH7OEIjG02PpPmdGIgmjBD6UeD9Q4hKzTipVuvGCjmeeikC47bjEECkO1I6Aj0QAsZEVaS8XiqSGr6prpzyvd+b/exDOjWO0uVYpVs92v6C95pGgSCwvE84acF6uWQzovd/bPBNXSsBFa0+
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443817d5-5dca-4046-6218-08db14134c95
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 13:55:32.4693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGztK5TgkZL+i6Z8TWE39C1lFVQIvrOxdiK2FE7QnE80SPlOs0cVDaVZIFC08s/h2fYOyWQiJ+MR222810bhmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7125
X-Proofpoint-ORIG-GUID: cutK_dylbRkmxVgzWGh0heOHCzfih7Oh
X-Proofpoint-GUID: cutK_dylbRkmxVgzWGh0heOHCzfih7Oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_08,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 suspectscore=0 clxscore=1011 mlxlogscore=755
 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302210118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_055548_855924_E043F3EC 
X-CRM114-Status: GOOD (  12.50  )
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

Hi all,

I'm excited to introduce myself and become a part of the community. 

I'm a software engineer in Synopsys and member of a team working to enhance 
support for ARC CPUs in the GNU Linux ecosystem.

I would appreciate any guidance or advice on how I can get involved and 
contribute to the community. I'm always looking for opportunities to connect 
with other developers and learn from their experiences.

As a final step of setup, I've updated wiki and added myself as ARC 
maintainer. Also, thanks Carlos, for help with my setup.

Best regards,
Pavel Kozlov
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
