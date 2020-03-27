Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69530C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 23:33:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3D9C206E6
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 23:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bfeus6Ei";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dxl3pYqg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ft4S3H4x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3D9C206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBDHjiVGDGcgQv5XvAS3MasNBmHqshsgZwDtLu2HvWo=; b=bfeus6EiaBULvN
	fS1ByzLvT0DMcthCrY4Es1pyoFmlC+0dmwhXlIpuWonirZHWQYRrgL8QdJuiEGWtHBBi4KmFZ+X8z
	4s84y9Oj7BarAIg/BtFf0Pe2PWz2o+mML0SHLdtzWwz5dEPxpIHjklNzvZtvVpIW47c6JGzXNzWYi
	I0UVvBzLapkxWmZ2V7gwX2DKdyeuDXO/ruzg2sHtmI4qX9r2qRmBa6jLf5LnSWQhpJGI/VK7jAaPF
	HtTAwEaP+f+X1ORGVje65aK6yorPgEWmOcD3B0NTDvKwU39P+f558hTGnKwlKqa0oLQpBqEVH3gZy
	Ced6YSy1mlblHgCYQ4RA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHyTi-0004PU-0g; Fri, 27 Mar 2020 23:33:30 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHyTb-0004P0-Rs
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 23:33:28 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C7BA4C0FAE;
 Fri, 27 Mar 2020 23:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585352001; bh=cKffS+5dVpd8kYBq49TGkXQVGFbYpvepgFs4Q+Dkb8U=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dxl3pYqghYD3HN01EAEDFG92Y/QL2W5BFzDL3SZIZoZn9/bSc+xOkd/xUoRZ/IMV6
 wmdYTxPSCVdYaM1BA8oTY38xwvX42bcOYMCEAQhga6/bQwjP8GS98A1UCaTkeCSR1b
 INevo3wA46bns3w58h5hC4x0S4w5eaqc7Yd2G2wlJkwc3hv+HU/5D8jmN4F7bHSpA6
 fpClP23sMEQnJOTlW/IV2CybsRQ0tumXriYy6R4KCrha0UinaIEYf85fSsKOGqJUhB
 L0ls1rWm3YYpFbLCvQf87DGl0maN4IC4gYK6F/ltZy5Z1Np/gh7cLt9Y/BNzusFcMP
 yGuQE0IIubt5A==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7F571A00AE;
 Fri, 27 Mar 2020 23:33:13 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 27 Mar 2020 16:33:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 27 Mar 2020 16:33:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jzs4jegZChrcEJkQLohiQ5tOhUy7fiAXwrcxbpkm3qYkb0HLziEBBp/SjhsBtVg8QpNKmO6WN17Up1NshOKYInFyyl4q9zq+ZB8uApXRDpyyyCCulnxvN2/jD8hu/nR7jnKxwSzOLYTVwe2P52g1C2+fwJE/DD+eRM/igoDUPSW8DMPnOJvO4BLgBV8Mnp92tKCXA3nFPtVO8UrFrUEH2fvhR4alzFlrnbz2eZBf+cnDZmZQJzIaqDsgZOHALveemQPu2wlR6Lpp5XRGNLy8q2JXKOK15904KPgGr62jyzynpWoX7qIbR22N2+Kc4CqqZ/1SlIZXBjxOHEIn1v0s+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKffS+5dVpd8kYBq49TGkXQVGFbYpvepgFs4Q+Dkb8U=;
 b=c1AbLgnsylZDYo0bvDq2yneJP9PJWqdFmpFRwoV97ds4UhENDummxpE7EckcoRLniHSKhTTfjw0MX7b4FFGe9ma/eMnB4YWTCsFkQw1S78Q8nbe57HPWGKKVoK6z2up4HOPJKydkcgtY/rBaawaQy3nLJlKhg6NYgrVsxL1WwN+MyvcUMPjt3zjNAL+hWUMg2wnRQvIL5+uVIf7f4oxGx1hoJMjW7azSj11tpQbsoLZP0RuraoyzjXpZJWJVPt+L2zs6PfxlEzP3XSVAVjVez0qst85/sLVDO4rqqptmboCQeB1ZO+Tp5D5rGZfMnfhZri8GCQ3+ZxqueqJtdQnUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKffS+5dVpd8kYBq49TGkXQVGFbYpvepgFs4Q+Dkb8U=;
 b=Ft4S3H4x214nUlJJVPn6Y4zl20WZNY3av5Mk/368eA/3kbEVoBpPy/p/YBWonvgLBNVanpBZVtR1JlvLvJoTfFsF/v9s7GSSJ1RnRTXhGlPysUIbFMYSzfEuN5af4q0BsgAhRgs9cKfYmo0tDbjHBEKC+RN6pgJimn6nqhFOoRE=
Received: from BN8PR12MB3588.namprd12.prod.outlook.com (2603:10b6:408:41::13)
 by BN8PR12MB3060.namprd12.prod.outlook.com (2603:10b6:408:4a::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 23:33:07 +0000
Received: from BN8PR12MB3588.namprd12.prod.outlook.com
 ([fe80::4949:d5a2:2d8e:d124]) by BN8PR12MB3588.namprd12.prod.outlook.com
 ([fe80::4949:d5a2:2d8e:d124%6]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 23:33:07 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 02/15] ARC: ABI Implementation
Thread-Topic: [PATCH v4 02/15] ARC: ABI Implementation
Thread-Index: AQHWAxFm54JlFNEhBkKvfA/7WM98LKhaKYeAgAEOuwCAAeG7gA==
Date: Fri, 27 Mar 2020 23:33:07 +0000
Message-ID: <22f16d08-b33e-f200-601b-4e0db6de4cf6@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-3-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003260138130.31593@digraph.polyomino.org.uk>
 <7a3df848-1ef6-9e54-3b5a-9cdfcaf436a7@gmail.com>
 <alpine.DEB.2.21.2003261843120.24611@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003261843120.24611@digraph.polyomino.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 087260a9-c26f-40ec-659d-08d7d2a7342c
x-ms-traffictypediagnostic: BN8PR12MB3060:
x-microsoft-antispam-prvs: <BN8PR12MB3060B9D07E2110E5B1936C95B6CC0@BN8PR12MB3060.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(39860400002)(396003)(366004)(36756003)(71200400001)(5660300002)(31686004)(6486002)(4326008)(6512007)(31696002)(53546011)(6506007)(2616005)(54906003)(186003)(81166006)(8936002)(478600001)(86362001)(26005)(66946007)(316002)(66556008)(66446008)(64756008)(2906002)(81156014)(6916009)(8676002)(66476007)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR12MB3060;
 H:BN8PR12MB3588.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L3sA+W3yksWbEE5ZmKmS4kGPK4sT/au5wAUSKQ4B7JIxFoBYzb7zqwOvWMrynFHk8YdRXlTyfZSEv+pGEF14JtPV9moEx91+Opkz1ChjVwUd98F4kl/MCe+CIkDAw1IX9ybmsSOqHBbrTGmkaZTfSUzpay7tOd9aTD9XHAXBvxKdWmJTbbmoUaRIT0YVNv4VR8Q7JPNjHdps2eMzsQSkEqntbX8ZzJn9YHqQzL5BA31+C8DhMM0VvJN5ezDquXFIUTNYw3gTEoNzdMddzsunYLQqT+IXRo4L3FBKUI+dAZdHD+mAUPhwtU4jvQXLlA9S0ziralFb/QYyNoNJJzcZQyfShHstclIi0UBZbpX0jaK9IwXm+6A4fd7XRjx0/oA+HItOmmg7O0YX9+FFzs9nytBvt1Al5BeGzfge32VnmPhx5bBc5+PUcEK47xmXgPDG
x-ms-exchange-antispam-messagedata: kA/iEceHDkxNvi+K2CPnpInzQvnb4kdA/svM6WGssxMUAMQGhniVMK8+X+MOqCNsATsEpLT/oGwgrfaSFAzgShUgvE5JjvVR55cmYewIAafcMrWic+h5nS0Y9Kq882PUDfr7EiZAVSLsveXUfGKbXQ==
x-ms-exchange-transport-forked: True
Content-ID: <5E7DBC5B5856D348A86BEFE06EB3539E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 087260a9-c26f-40ec-659d-08d7d2a7342c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 23:33:07.1211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vx7Bs0MdXOJh/fK+LQUIqZvm2Iz2DUja43l+dw7M60gLst0haxHyph7/j73qELHMlKLm2LfaVMUHOkO3xX6GrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3060
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_163324_026044_472C1702 
X-CRM114-Status: GOOD (  15.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/26/20 11:48 AM, Joseph Myers wrote:
> On Wed, 25 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> Hardware-wise, ARC can be configured to be LE or BE and software supports that
>> (cfr Linux or uClibc). The initial glibc port was only aiming LE but we ended up
>> with BE as well due to a customer engagement. And given much of ARC port is
>> currently generic (minimal asm), no real change was needed except enabling it in
>> this header. We do plan to officially support it so I guess we need some more
>> changes in Documentation / ABI listing etc.
> 
> Yes, if you want to support BE then it should be documented as supported, 
> it should have its own dynamic linker name (with consequent GCC change 
> required to use that name) and it should have its own build in 
> build-many-glibcs.py.

I added bits in sysdeps/arc/configure.ac and corresponding conditional in
shlib-version. But I have to ask (embarrassingly). how to I regenerate
sysdeps/arc/configure.  I tried all possibe autoconf cmds with toggles (both at
top and in sysdeps/arc) and even reran configure in build tree with
--enable-maintainer-mode


>> Right, we've had 2 ARC ISA: current generation ARCv2 (basis for HS3x and HS4x
>> processors) and the older ARCompact (ARC700 cores which run Linux and still
>> supported e.g. in Mellanox NPS cores). From instruction set pov they are very
>> similar (although not binary compatible).
> 
> If they're not binary compatible (so you can't have a binary that works on 
> both) that indicates they should also be considered separate ABIs (so you 
> have four dynamic linker names, each with corresponding build in 
> build-many-glibcs.py, plus any other variants that are relevant to build 
> in build-many-glibcs.py without being different ABIs, such as hard/soft 
> float).

I'll drop ARC700 support for now and we can add it later if need be. I suppose
there are no other ABI/versioning/compat complications in such an approach.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
