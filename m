Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2DFC0044D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 22:58:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2B382074D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 22:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hSj8bTt7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QDoEkuiQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KrgQSdRu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2B382074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2/GQ37A+H9qlH04fCXgY1tqliKR/UnWGJCvBRn23Yg=; b=hSj8bTt7Imswmk
	i7ITymm4QeGLMtA2Py82WhS4klK4BAPbib8JNJLja7FvNdcfCGE3edh79sYRmPqyYcz+MSKsjoZr+
	td1SH+zPdljMCJmHXvuNrjq8aJvFGaO4ERHAuttLAj6XgdiqMe+cwDl4Oym+N6CC7aVxo2yC/2e61
	JlZUD9B7QWXTAvAeOG1j1SoLyWaXxRgP+lQx0jZgmDd6F5bhUfm4tgPQKgW0zc++cxV6ffzxg0W1j
	yYNYutCG7Wh04GVwTjF+uY0Qs8TTjro+zwwsixyMzUHnp8jg6UP3K0XI4WvYz4zLta8D8a0+2faeX
	c924Kew6DdBfPP0Hg3eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCAJ9-0002Pw-2y; Wed, 11 Mar 2020 22:58:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCAH5-00009s-S9
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 22:56:29 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0682DC00A8;
 Wed, 11 Mar 2020 22:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583967387; bh=iB9rY3X/+nEjiK2EOej24PgUTX6oraVabqUg4AHiBoA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=QDoEkuiQ0yVM86rLaUbqUlGegY54Ycz9CSbbvR5Rr/bbQCxnXb72s4BtKLXuPcl1y
 Q+pHxjzUyopzIizd5fitgFyCO3K2puVEx9ULaGHhVfChgwjZzMJqbZhE+iL4oTSA4A
 dnFzv53omyGiZA1otlukGfrAkVBoTETUI11Eh63mqWUSnhjhyYbYn4LJ8K4hLhCFh3
 pZJuzo41m/BfwuyquPl5nZ4m0V1RYwiB2OMFycgo5PcvS2H2uPYgTVdEmBzakHXoQp
 d200PFG8PF7bTgzSQeZ5Bxi/rW6dmtnKTpQX+m4IoJjD3BOz7OkJvxHoGaLeH3qZ+i
 1Im4ABK9qGCBw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id CCAE5A0085;
 Wed, 11 Mar 2020 22:56:26 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 15:56:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 15:56:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iroAdmjHWnUvghah2OsurrY5DadR2g/ZxMf/sIqsMh5+pgtzZAQgBVsYB9Q6B8SGvP4H+7eRCB4s22J+WQ9DpbDqUr1WryP27BJ4pbcdMjq8CBzK6Syaucv5FNVGU6uj5EYMdwLSg3l95iwAj8r1PLjpvbpnFvj4vge9RybG7S2YJjEL8YGJkr3OgFL6Y/prbWR/2ZlNigyi4teF6pm0kM3j1AnHXAPOJ+dT9OvXuwDvfEvHu6D/58dW51rjrnYyq0UzymUMGjwxshkjN6tB7clGIFUtlY0UE8RIdgWVOZmYG26fRz7lJoN/bV7Il9HGXH14cvjmL2zqouGda76yGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iB9rY3X/+nEjiK2EOej24PgUTX6oraVabqUg4AHiBoA=;
 b=OMVehlJxZTMj/X/BtHyj+RPOApcuFKEGtqmi8bIafQu3BgRcVnUzw2Z6W5QyXecIagbdIozhSgbY7B9wqt5F9cCFExu/U4VZkoePQVPx44w8BW/Jfwz4YTFhzFe/xvSm+NKC/kcflHysVBvBPSs6FkYKSVtvlgaBtuQSgii0Qk/CQXsYo2ngrUvPHO+HAX6gyPA0wNXUExLLZx5sq/Pu/0mhLF9Daw9u5a440dFH0lc9nsJwqCmma/hzPDfo7ASbuonkzIBXC92BvdL6nPjsTZpwF9WShC/M2W7cBLu/oI/W/1UKWt2pGXKOMImIAxV1bhHXR//920oRhe3LHj8Kfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iB9rY3X/+nEjiK2EOej24PgUTX6oraVabqUg4AHiBoA=;
 b=KrgQSdRuDMiqwcYVu6mgZl3/rq5cSCKvnm78jKsTXOmJplcrqdj+ATMi/ChV0ZnARXanhRBSCfhprtGJLlUdxGANKTF+1al9VFy/VlDey2BzFq04jxzMjPJDxNwL9dRnV0hazjKrx6J0vmcDoG+AvBpbnEDPjIyxUDkVkhyHddQ=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.13; Wed, 11 Mar
 2020 22:56:11 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 22:56:10 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: DJ Delorie <dj@redhat.com>
Subject: Re: How to elf/tst-ldconfig-* in cross test setup
Thread-Topic: How to elf/tst-ldconfig-* in cross test setup
Thread-Index: AQHV9/R629dkX7tSWkK2XcvKH3zd/KhD+5kAgAAFAoA=
Date: Wed, 11 Mar 2020 22:56:10 +0000
Message-ID: <ae672720-ff2d-c6b9-3e48-7ab4b465b1d9@synopsys.com>
References: <e92a698d-1378-5990-d7f8-05c27c5bd689@synopsys.com>
 <xntv2u4jca.fsf@greed.delorie.com>
 <4d6baa8e-2fd5-061f-68aa-eca6e11a3999@synopsys.com>
In-Reply-To: <4d6baa8e-2fd5-061f-68aa-eca6e11a3999@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 838ff8dc-b090-4ac6-35d1-08d7c60f6488
x-ms-traffictypediagnostic: BYAPR12MB2727:
x-microsoft-antispam-prvs: <BYAPR12MB27271C60182ABDB76C6F5720B6FC0@BYAPR12MB2727.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(199004)(6512007)(31696002)(53546011)(6506007)(86362001)(76116006)(31686004)(66476007)(71200400001)(66446008)(66556008)(64756008)(66946007)(4326008)(6486002)(2906002)(186003)(81156014)(8936002)(36756003)(316002)(8676002)(54906003)(81166006)(6916009)(2616005)(26005)(478600001)(5660300002)(47845001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2727;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n5g3ss8j4816XPTHF0TY10v3IOmflFHV0rPBukQj13sh+d+arSeRtBYG3e0Qk8O7eecJdcOklXEv4wPZxZwE0fEm5TmIzco5H5dH3WrkOo0YoxIPQmXNyiFErcNEWwnbx/Vo1nQBqENWNYaobWmxLV39ursp0PFNEq/dGNlHB64CGdcKZZY1PGil/y7DQg7DxeTX0c97fXuUaIsvy2rBP6H87z42y8d/pd25zL7Dv/F+mREpdeoqamnEZwnoBJGIHCivMBseNZqR2NQpkAI4eG3rLFDzP+UX7Wd6Pd4BmIP9ZayJ6teGKIvEln9/whw/7R1N6LT7YD4hXJhpnkMT9sfrt+ITmNjH+3Y9eSUzHy+Zor3n8hgoxsK4MgzjXYiILs+LaBTqrK7bWBSfqjKdPPROtut5RZ5wDEvcp6QXU55PKfuSwP3NBdGPJ5GstkzA+GP4xqmHTs9WpL/E67rmKnw2jjTkF3bwZvHbOHLH0VA=
x-ms-exchange-antispam-messagedata: OyXu3p28KjmwCl0jXIULTWmranGxlRlbQtSEEBSnpwDszN02Kt18Mmpu83Xyh6yHvDNmNeVaZvoNVPGesx2Q8HL9/ydsWVjQ+p/jld5ddiqNUg9EMUn/HPCOVPFal6jsdSsXcZbuLtgu2nkZEtERRA==
x-ms-exchange-transport-forked: True
Content-ID: <0FF2BCFFEE36BF4DA09EA2C15E6E8F47@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 838ff8dc-b090-4ac6-35d1-08d7c60f6488
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 22:56:10.8542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HxL8+qvD6TwF+cmZDhspR7Hv6LOj4nrJSmUTSobRmaFfjSDITvVWAM1l84edz8HG+m6t3lg7SsF+UgSBs1grZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2727
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_155628_059909_F21EC1DA 
X-CRM114-Status: GOOD (  10.93  )
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "ahajkova@redhat.com" <ahajkova@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/11/20 3:38 PM, Vineet Gupta via Libc-alpha wrote:
> On 3/11/20 3:28 PM, DJ Delorie via Libc-alpha wrote:
>> Vineet Gupta <Vineet.Gupta1@synopsys.com> writes:
>>>> $ make test-wrapper='<full path
>>>> to>/br/build/glibc-867196a7635/scripts/cross-test-ssh.sh root@192.168.0.20' xcheck
>>>> subdirs=elf
>>>
>>> FWIW the original failures were here
>>>
>>>   lock_fd = open (concat (pristine_root_path, "/lock.fd", NULL),
>>> 		 O_CREAT | O_TRUNC | O_RDWR, 0666);
>>>   if (lock_fd < 0)
>>>     FAIL_EXIT1 ("Cannot create testroot lock.\n");   <----
>>
>> That's inside test-container.c and should be referring to the
>> test-root's root (i.e. <full path to>/br/build/glibc-867196a7635/testroot.root/lock.fd
>>
>> Is there a UID mismatch between the two systems?
> 
> Possibly because I'm vineetg on host and running testsuite on target as root.
> 
>>  Did you run a full
>> "make check" at least once, to build the initial testroot?  It does a
>> full "make install" into $build/testroot.pristine/ to use as the basis
>> for the container's root.
> 
> I definitely did not do that - let me try that.

That helps, atleast they no longer FAIL :-)

UNSUPPORTED: elf/tst-ldconfig-bad-aux-cache
UNSUPPORTED: elf/tst-ldconfig-ld_so_conf-update
...
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
