Return-Path: <SRS0=N5rj=ZD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A400C43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 22:44:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12AE8214E0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 22:44:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NR6N1uuO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VgH5hpwA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="lIOOO7+x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12AE8214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksuKbA/LOpyaHViEYXB99+GNuvwGDojw8FDz2uRzSdg=; b=NR6N1uuObyR7oq
	I+OoGerfym8LimtLDB9LlBCLvakWeCSaKP2aHf1/PnB9hV7xIJgKXtfFQ3vC23MWs32CL3MAgt3jm
	tqToCokU+A4k7Z/qD6Se//deGVVnnFcL617mqATkdPhyn8J70/IVzytoRTP+NojjhfnmqfQC3WRDB
	61bNmrS1cASXkg1870MHFk3IDWRSmzadqdWGcFPEBHY2PeTnuPCp671TKMwgGOTjf5kkLKj86W+B0
	u8TSDzalR2imJpqardo04hz280vHWIDR66md3amZZ8TT6M2pbmJKt8h+SqgnyVdq4LPjT2tx+/xXH
	f5GeszDKMHswmmpKnHwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUIPk-0007PB-W7; Mon, 11 Nov 2019 22:44:05 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUIPi-0007Ob-Bi
 for linux-snps-arc@lists.infradead.org; Mon, 11 Nov 2019 22:44:04 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6DA99C0E35;
 Mon, 11 Nov 2019 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573512241; bh=W/3gN8OmOmrOafnVYnSzcRIXqdHgmcL5w+CaDrXEB1E=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=VgH5hpwA8KCvwsab0YNTg8Kvg/jf1A7qNOb5ttSFp2ClC4i8T7JvO6VxfVRF9nvSa
 IUZhu1jgHhOchOTjVIItpkFj7fJAn/+t3uogI1HyZKS8sDazpQ+pGgx30ljhHSfgWX
 RTMlRZ3d4mTJXhlDYZ2Z1+gVOUUsaUyS6WciJitH/Obar2rvl9itDarMDUA4aNV+uu
 Hmfu2JuF1hEHFV+e2UGsmJfAdzRs6OIg/ecfK3mMV3YAKLPLpIIXNUJ/9Yay98A30u
 7GVR8ierCOmByoJ1A2+tC0B7iYZf0lnrrrpTBeAgikBUuPNtqy+HlRMTmQyyt3q7+v
 0uxbawteFb1pg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id CF134A00D4;
 Mon, 11 Nov 2019 22:44:00 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 11 Nov 2019 14:44:00 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 11 Nov 2019 14:44:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggVisumRzkof+1ouM/liQepZrqpbhW6RHVioYAZRKKDPflMAsYITOxjDRS50AnuEnT+cfWXr3VMYIwGFo8UA9iJvF0epKZtT59Hao5JqdptaiRFtY0B5rdsRchPkFu5BDYkJHQrfMm6RdDah7ITfakuePbzrRCRw20C5H5KDfj+X9yYCjY+xQ6orLnQdB9zuu3rOHcjvnrNJPpfZQILMV9iZRApDSjuxjk6/XGHAr3Wf0e4eN9lK0kyfWVRqv+NqdS79RyutufTES4USq28mUtbKwoPp1DLqlUdxCa6XFM3bD0aCbRh+qpkK+UMjeWBymkjqpYAzTsRE0oklBkR+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/3gN8OmOmrOafnVYnSzcRIXqdHgmcL5w+CaDrXEB1E=;
 b=hGM1ySA6QwUhL2YV6J+K3Ae6Ck5XtzbIh6RQ0JMoR+RsCTwX/cRCihbQDEGNpHUGQ5xMoOIm3fO7+FxWeYWzAnIEL5JzGaSiiwr7k9NBGxqdQUPOWP6UYKXEEmFXnD9cxknDmS4tnv7QJfJ8D59TbKXqJ4LWBbNiaPXOh55bvDdA+mxsrWreu5GHBMUyhnGSEt6WdHBpeQscGHtXbRrP1GZpR68j/xG4EAufT16Ic0WeAF+OH5rcTnMc41ExyefwQk3ZdRc3yuTuq8vUDW0U1LDhOXkwYOMfVrbINEYpLSd6wbE3zucOxcrsTyghwNc5l4wTEvKp62X8JT//JiuTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/3gN8OmOmrOafnVYnSzcRIXqdHgmcL5w+CaDrXEB1E=;
 b=lIOOO7+xK/k8u3A9tg93/owmnAWz3uIg5tz0avihhiOljz4hSokNtNOWZh3i1xHmeLuO3tqwfLjYP4bi5BdCGPUkPAb2kvJMHuHuGdgoibul7DWr25Xr5b8FTDQ0MYmYcvpjyj48/c5eA4HxHy6tJjxCFT4WUXg8Xv1kt7TwKbw=
Received: from DM6PR12MB4089.namprd12.prod.outlook.com (10.141.184.211) by
 DM6PR12MB3802.namprd12.prod.outlook.com (10.255.173.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Mon, 11 Nov 2019 22:43:59 +0000
Received: from DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd]) by DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd%5]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 22:43:59 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Thread-Topic: [PATCH] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Thread-Index: AQHVmMhocoZKwAHt6kOZWXaMGoZuO6eGjpgAgAAC2wA=
Date: Mon, 11 Nov 2019 22:43:59 +0000
Message-ID: <7d22a532-6f19-6b43-2e7a-f6087f658606@synopsys.com>
References: <20191111194349.21813-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.1911112228550.30786@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.1911112228550.30786@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87cf594b-7c49-49ec-ae61-08d766f8a478
x-ms-traffictypediagnostic: DM6PR12MB3802:
x-microsoft-antispam-prvs: <DM6PR12MB3802F436C438858B8B84399FB6740@DM6PR12MB3802.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(346002)(39860400002)(136003)(376002)(199004)(189003)(66066001)(4326008)(6436002)(11346002)(8936002)(6486002)(2616005)(316002)(486006)(6512007)(36756003)(229853002)(76176011)(71190400001)(53546011)(86362001)(65806001)(58126008)(102836004)(54906003)(65956001)(6246003)(476003)(446003)(8676002)(31696002)(81166006)(81156014)(256004)(14444005)(6506007)(7736002)(14454004)(305945005)(5660300002)(31686004)(99286004)(66946007)(76116006)(3846002)(6116002)(66556008)(64756008)(66446008)(478600001)(71200400001)(26005)(186003)(2906002)(25786009)(66476007)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB3802;
 H:DM6PR12MB4089.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CRZA9oT1Nh9HTPafNo8ZAPZAS7TCcqxvrshtIFu385LfIJk5gzP2TtefNbQTazVcqzIaxrIpxRFCqdLlkmujUBpe/ysofLVLF3a6ju/q0gv+u67qOgjjjQO6ZFCbCg3kRDi6/IchuK1obSVz+CWXBG4rEbE5HPsT9RkxMi7Zr5+yTghQThJ3vQCr5egydkBmkVKD8VuaCT79vlSRefyeL+VO7WRNlAiXYWBehyjrRr+o744jROPyXuklOHHd+Y4sahxTwgdR2rQfx2rJP7dlfreMmKanLJQfvkNtTeyrPA7TBv8YyK2qZPfsaaGRHNLkxsIUEas7RPA/7Av8WL6GhpIFNrCUXKE+tUwAFESDIRfnEMkinXd/RXe+n2UojCPtV5vHjMl2O9pAXPXSAgLwTqzdqoJwKd2erHOwEcvI4v7RYcwNLdJD01EmT0n/5NlQ
x-ms-exchange-transport-forked: True
Content-ID: <F2EF78BDA00CE04FB02BBB0395FD9847@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87cf594b-7c49-49ec-ae61-08d766f8a478
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 22:43:59.2613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PFKpBM+wxOAAuP6fpSoJgEBcR7Fz2O+hIyeRJxQNnNZG8G/qmdjNiB+w3Rn7foQiIPJzdrc2aarV5y9ueY6eqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3802
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_144402_498162_9951FD01 
X-CRM114-Status: GOOD (  12.96  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMTEvMTEvMTkgMjozMyBQTSwgSm9zZXBoIE15ZXJzIHdyb3RlOg0KPiBPbiBNb24sIDExIE5v
diAyMDE5LCBWaW5lZXQgR3VwdGEgd3JvdGU6DQo+DQo+PiBGdW5jdGlvbmFsbHkgaXQgc2hvdWxk
IG5vdCByZXN1bHQgaW4gY29kZSBnZW4gY2hhbmdlcyBhbmQgaWYgYXQgYWxsDQo+PiB0aG9zZSB3
b3VsZCBiZSBiZXR0ZXIgc2luY2UgdGhlIHNjb3BlIG9mIHRob3NlIHRlbXBvcmFyaWVzIGlzIGdy
ZWF0bHkNCj4+IHJlZHVjZWQgbm93DQo+IFRoaXMgZmVlbHMgbGlrZSB0aGUgc29ydCBvZiB0aGlu
ZyB3aGVyZSAic2hvdWxkIG5vdCByZXN1bHQgaW4gY29kZSBnZW4gDQo+IGNoYW5nZXMiIHNob3Vs
ZCBiZSB0ZXN0ZWQgYnkgcnVubmluZyBidWlsZC1tYW55LWdsaWJjcy5weSAtLXN0cmlwIHdpdGgg
DQo+IHVubW9kaWZpZWQgZ2xpYmMgc291cmNlcyB0byBidWlsZCBhIGZ1bGwgc2V0IG9mIHN0cmlw
cGVkIGdsaWJjIGJpbmFyaWVzLCANCj4gc2F2aW5nIHRob3NlIGJpbmFyaWVzIGFuZCB0aGVuIHJ1
bm5pbmcgYnVpbGQtbWFueS1nbGliY3MucHkgLS1zdHJpcCBhZ2FpbiANCj4gYW5kIGNvbXBhcmlu
ZyB0aGUgdHdvIHNldHMgb2Ygc2hhcmVkIGxpYnJhcmllcyAoc29tZXRoaW5nIEkgZGlkIGEgbG90
IG9mIA0KPiB3aGVuIHJld29ya2luZyBob3cgbGlibSBmdW5jdGlvbiBhbGlhc2VzIHdlcmUgZGVm
aW5lZDsgc3RhdGljIGxpYnJhcmllcyANCj4gYXJlIGV4cGVjdGVkIHRvIGNoYW5nZSBiZWNhdXNl
IG9mIHRpbWVzdGFtcHMsIGJ1dCBzaGFyZWQgbGlicmFyeSBiaW5hcmllcyANCj4gY2FuIGJlIHVz
ZWZ1bGx5IGNvbXBhcmVkIGxpa2UgdGhpcykuICBJZiB0aGUgdHdvIHNldHMgb2Ygc3RyaXBwZWQg
YmluYXJpZXMgDQo+IGFyZSBpbmRlZWQgaWRlbnRpY2FsLCB0aGF0IGlzIHN0cm9uZyBldmlkZW5j
ZSB0aGF0IHRoZSBwYXRjaCBpcyBzYWZlOyANCj4gb3RoZXJ3aXNlLCByZXZpZXcgb2YgdGhlIHBh
dGNoIHdpbGwgcmVxdWlyZSBtb3JlIGRldGFpbGVkIGluc3BlY3Rpb24gb2YgDQo+IHRoZSB0eXBl
cyBvZiB0aGUgYXJndW1lbnRzIHRvIHRoZXNlIG1hY3JvcywgYW5kIHRoZSB1c2VzIG9mIHRoZSB0
ZW1wb3JhcnkgDQo+IHZhcmlhYmxlcywgYXQgZXZlcnkgY2FsbCBzaXRlLCB0byBtYWtlIHN1cmUg
dGhhdCBzZW1hbnRpY3MgYXJlbid0IGJlaW5nIA0KPiBjaGFuZ2VkLg0KDQpPayBVbmRlcnN0YW5k
LsKgIFdoYXQgYXJjaChlcykgLyBidWlsZCBvcHRpb25zIHdvdWxkIHlvdSB3YW50IHRoaXMgdGVz
dGVkIGZvciBpbg0KYWZvcmVtZW50aW9uZWQgd2F5IHRvIGdldCBhIHJlYXNvbmFibGUgY29uZmlk
ZW5jZSA/DQoNCj4gKEluIGFueSBjYXNlLCBwbGVhc2Ugc3BlY2lmeSB3aGVuIHN1Ym1pdHRpbmcg
YSBwYXRjaCBob3cgaXQgd2FzIHRlc3RlZC4pDQoNCkkndmUgY3VycmVudGx5IHRlc3RlZCB0aGlz
IHdpdGggYnVpbGQtbWFueS1nbGliY3MucHkgZm9yIEFSQyBwb3J0IG9ubHkgd2l0aCBhbmQNCncv
byBoYXJkIGZsb2F0IHN1cHBvcnQgYmVpbmcgd29ya2VkIG9uLg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0
CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
