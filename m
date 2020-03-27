Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BA3C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 23:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 271D52071B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 23:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VMVU9zIS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eHNSr4w9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cyrNVg2a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 271D52071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Zb+U9YCTS/9uPhMsCIuE7I+cPCrxpHRbd2WCuQ5V1U=; b=VMVU9zIShQhKxV
	QovRh6Pl6kvCSf3q4gevB69A7tnfdn4oseJvEX4o/k4VEkaA+QxzEb5sJvgnM/yPFXzbh9K2OMwk8
	Plx847J9niDjXsldebfdKvHXQXqHIG8lAzRIYl53+F7fzRjXHQkweIjzg+MwMJf23UWbTrwbDYDt9
	kVr/nSqospSAyGO/I2KtAdtxryXbbsMV9CSL0JjO/FmCLo7NYi7Qezb2nBCT8rnf+gzIMcFqQi8pk
	0u8Xt424MDywn49TIPsfAIABmMOSBySFYmgnvbcJDrf/VEBn+k5BDnU7W07t1gdxWto2GpaEwg6d7
	JmhdKqnGk8+iJfoVAc2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHyh3-0000Ki-Hk; Fri, 27 Mar 2020 23:47:17 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHygy-0000KF-3N
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 23:47:16 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 73650C0FB1;
 Fri, 27 Mar 2020 23:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585352831; bh=s3MhUab6SKT/cUsKYAjBp3YIa8csiSatNX7bTojm2rQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=eHNSr4w9eXgT64qs4gNiTAfe0jud3rdDQ05JgxyL8EWUmk3cT3s+jkWMPomb4xaUs
 HiZM853fAGEwrSo5rZAc+BQ4I+s/79sKHW8K+es12uRhgNhmdK1qEj9AKTdNYJvliw
 XVPN5mqOlypXAOQiihhuiEvfFgpaSo946AhOafztynB6iaNE1avVs5tuvVGbYeJY4f
 Jt5Qj6q0xTK3Gz+OKhq2Zh5Tp45bBv4ggrEF96TWqEqwYEkYkT71MtDE+qE6fswKQn
 vywIvSH9ccBiTi8kXxWcAv4j2C/hC8TgZyJQL/wJyMne/W6EIIl2hIJAnsLXYON13f
 kcDjFmHJMglTg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 12939A0071;
 Fri, 27 Mar 2020 23:47:10 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 27 Mar 2020 16:47:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 27 Mar 2020 16:47:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFrRsMBKes+nYD++FKAgB2HMnyfBp/1KfwpuS8P9fYdWu2xtDnQIFasM5Ph1ruKTRupfm6uEvulMW+i1M41/IA2tPACb0orU5IRiPYhkF1eo34+R8QMFK6/5xQcgMbxwSeoKoUN0+248pm5HaFXZPJ3olgsKyjjBWd+fp+gBiHyp1l4QtwXO4QSN1zjhmZvQGPR3tODzWkjv0Fvzt2QPceR9QkpBtRE24NSn6JtztiBSBpjnummhFCYO+qVi4JR1BDLN9jW6bqoLoCnlTYMhuDm+WARmcOh3UalQ9fNiU9B7C9ZNgew+yMAF0KSa9kEoFK9l2dAi7cGqQFnzvIJdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3MhUab6SKT/cUsKYAjBp3YIa8csiSatNX7bTojm2rQ=;
 b=mtgGOrAE/p75CAJubQjtHpky4ILxMlTGeH1w/KkDrxX820VF7TqjwVmX/r3K+f3CIva6cGIff3aWksZ0w+Cx++CY9ssppYsCgNreLLqsCfiiBOZtcZ/yCvjLnxoEIUsk3I6RAVBMeaaDl9m5d06UmlsLntkYsPvfGVE/lOSj2I/0fxeV0BJF0KLxmuTu7visqrWmZSlJNW5GV5PfxSkkdRAwMROERjCrht6P0/WeyLE7dCY4m4g55mYrbACmjxUQAcYKzNuRFWztYBioNUtTJ5K0rOEa2MDSYh10Uvgbf4xOwzTTgstuX+tCLj5MlU2KF7x9KOc2tAN+XZGlPoaTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3MhUab6SKT/cUsKYAjBp3YIa8csiSatNX7bTojm2rQ=;
 b=cyrNVg2a1Xb9MtPEMwk7a/8A6Xc4XDwo3A32J2+xozMHlV1NhhxLDr78sktMdUKbhzRpVL2mqiy1GV7zmkfJ/+RcZCCTLYlAZ2qkgGxYVtJrFKWHtvGYbmVZD5Ecpss0KAd1MgvLz0tvdggFCcfg1UzYBvDsz/ZfQidsOx3p+9E=
Received: from BN8PR12MB3588.namprd12.prod.outlook.com (2603:10b6:408:41::13)
 by BN8PR12MB3603.namprd12.prod.outlook.com (2603:10b6:408:4a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Fri, 27 Mar
 2020 23:47:01 +0000
Received: from BN8PR12MB3588.namprd12.prod.outlook.com
 ([fe80::4949:d5a2:2d8e:d124]) by BN8PR12MB3588.namprd12.prod.outlook.com
 ([fe80::4949:d5a2:2d8e:d124%6]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 23:47:01 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 02/15] ARC: ABI Implementation
Thread-Topic: [PATCH v4 02/15] ARC: ABI Implementation
Thread-Index: AQHWAxFm54JlFNEhBkKvfA/7WM98LKhaKYeAgAEOuwCAAeG7gIAAAKWAgAADPwA=
Date: Fri, 27 Mar 2020 23:47:01 +0000
Message-ID: <d5d918a6-4b0f-295b-b83a-e7b79ed89b0a@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-3-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003260138130.31593@digraph.polyomino.org.uk>
 <7a3df848-1ef6-9e54-3b5a-9cdfcaf436a7@gmail.com>
 <alpine.DEB.2.21.2003261843120.24611@digraph.polyomino.org.uk>
 <22f16d08-b33e-f200-601b-4e0db6de4cf6@synopsys.com>
 <alpine.DEB.2.21.2003272334320.5132@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003272334320.5132@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: 5872a98e-c140-4123-dbf1-08d7d2a9259a
x-ms-traffictypediagnostic: BN8PR12MB3603:
x-microsoft-antispam-prvs: <BN8PR12MB3603EC57334DE388DED28074B6CC0@BN8PR12MB3603.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3588.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(53546011)(8936002)(71200400001)(6486002)(4326008)(81166006)(2616005)(6506007)(6512007)(4744005)(478600001)(81156014)(31686004)(66946007)(36756003)(54906003)(316002)(2906002)(26005)(66476007)(6916009)(86362001)(64756008)(66446008)(31696002)(5660300002)(76116006)(186003)(66556008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: outVwrkSwa+0mKP1BsabMGTjJrs98xU4QVUqoMhbETlkcqfeefaN1KWl3qIQAKKis4wwD+d3keLVnSIfChhcuJXjZDbQudE8dINw3COZgua1Rwr0IbY5F6xC9J3J3EGXde4Aek4MMODu1avg1rvCe8BCWbwPghJid3Whz3coBtHvFGMZeJmcGyvH+thvoTmLrAkt5isIo/t/svsWheqXwWbN4WujsxffZ8jiHM26hWQGEj/1ACo4q2dPJIgTB6Iei/18LsG+zb+xZMCxDDR3OQ5Dgh0TS1ep7A+rbYnUmMXcL2lOlR1WRLXtlVzbFQBlt9Sr4J8HO3eYy4rloUws88XvvUtG+jPi6BVCMz9HdQCY/fzHIw6P3NqULkFjrZEWuMHtygB1EhICS5omw4K2lwmRjjkm8IS95wFLXtv0F/AWdLgmX62sMkgo9BqmnqPJ
x-ms-exchange-antispam-messagedata: me4J72qOasV/nX/Kkv3gdA+Th4+xKjCl+6HeEu/L9TLYCoQjXoDJb8AvOOXZD69TjABlQlM16w/iyfP8a7Magip1VKuekBnJ2x6dqTaz4GclD+vLMGc+eFGv58bY6li2BJvU9csTswGHuzB7g/LJ6Q==
x-ms-exchange-transport-forked: True
Content-ID: <6DAFD764EE68E243A2B065B0A9F40B8F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5872a98e-c140-4123-dbf1-08d7d2a9259a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 23:47:01.6207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jUzbos2gYV0xY1PKmLJY5zQa7XVqqqWH9yBw+jQJBO30URsoYVsGRL7UBboEm4+kWDLVdHKPElZhCCv8xAKmxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3603
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_164712_214327_7895DB92 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

On 3/27/20 4:35 PM, Joseph Myers wrote:
> On Fri, 27 Mar 2020, Vineet Gupta via Libc-alpha wrote:
> 
>> I added bits in sysdeps/arc/configure.ac and corresponding conditional in
>> shlib-version. But I have to ask (embarrassingly). how to I regenerate
>> sysdeps/arc/configure.  I tried all possibe autoconf cmds with toggles (both at
>> top and in sysdeps/arc) and even reran configure in build tree with
>> --enable-maintainer-mode

> autoconf sysdeps/arc/configure.ac > sysdeps/arc/configure

Much thanks.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
