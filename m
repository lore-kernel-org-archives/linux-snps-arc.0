Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656CEC43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:10:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27BAD20784
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ohOJbWvs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K8aVnvjj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gAaNJBgt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27BAD20784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lWe0sUTD9WAJvDRuhnf3iHIQoRIJpYhyDp7tGR75bs=; b=ohOJbWvs7l+dQm
	mPc/efR/CQeLW5Qyx9Ibb53Ht+TAcDEdOp+P7UFA8h24J3ClM2UTtKi8o37SFVZkRZ4fGY93fz/Xd
	RaiSpRZ1zwCaBCM8Vub0vSCHIMFAHS7VAuW9335RvsIeAyYxpkuKXMMMEemr4xXCBadp1G1aSUrz+
	28pzAaHUvgGtdv0NLE/k3WuNcJQlNYFwU4ml02hjBB/o1jcYNCd9Tb9fy5eDK4NiJZomlqUdortge
	JHmhjszu0h5eAtGcA+2bX3ncbaTnNtlRL7N0O2tJjRCDL1jEPOHPmhG1QZAmvGkAKN8mcwW/R1oEs
	MAwo7tqbCgJGZWoJlFnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJO9J-0004Im-Mk; Tue, 31 Mar 2020 21:10:17 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJO9F-0004IC-1I
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 21:10:16 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B0B8B40634;
 Tue, 31 Mar 2020 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585689012; bh=CITeQ5ubW4BSZCPVYe38+GmT6rP4MBlNoTgAzbWBaeI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=K8aVnvjjiTTSoZGTig4roOz8ue3h3bMgIIKXk+AX7X98yFThipPBJxsnhZ/HO+GZ6
 N6onrHMD63dy/qGgIV9xRgq3mDXHGStMxr2GButummvD718+YGJkInrGq3LDfXJ42t
 zKJOWVBjySGScrIZOL0RQ5eKzq0O34oh0qShwC+QU9mSUBpfp50rYI9qFslpX/hwEV
 13zaJO/3ek3kbNcHasZCVilPB9Jf3mboxu7jAT15eGndNuEhBR3RubNOrCuGLgPTYE
 OzJISoZWabz9XNi/mAnWEwXVqD2UpCTTfoMuXaLaY2NjgHEThQhiGUMyPjYmhPzsf9
 ox4/jE+QMOQHQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5015DA0085;
 Tue, 31 Mar 2020 21:10:12 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 14:08:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 14:08:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A62Nhk7poZQhm79+Lfr+obL+iKs+jodYnLhQi22s+nksUz3BncF97WXu1t6KZFFJgwa8mOF5e5+LMDJLkOycgcpU6gQRYaaYmkw/Y5n0mRJUZNUuzSVNLayOFXDV9AQWzcj3D992MclozsW7OjfkK95T/hR7/PLliAmC2GCJ+aDuISYQf0LVPDihXyEF66Ko+j7PYqFUqTbkMKRY9mEr+oehSZLlzMNk7wgPRMV8GO8H4/xEaTo0kQuNY2MoASjPS9MlBM2ZLEss4RompZis2PcqTFhpI9O9TSPYj2qzOHx5ElaxwmxH/m1F6jUxv6ghivpYiETNsi1sxW1AFlHM5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CITeQ5ubW4BSZCPVYe38+GmT6rP4MBlNoTgAzbWBaeI=;
 b=DM72d8rKMqBDPdI30jGv600o0VvjWxM9ASA5ZShSj0nWGk1T/iRlxSpBc8G26xweB5y9YZwZoMEg5NSpNRP5EEKDBbHQ32d1BKriDF1YhKWnXjZ5V8AylUOH28AOZZ0zLU15eXViBideg+HAFxVGTuObsvBU6BgNsm1q3yFqdMc7c1SRhC3GBmlAYmmFiZOIaROjW2UYJlAaM+mjFLC0Njp/isx/+GgVEzQTLSk9UMm2xNGBiL1oAVWnbGTAw9YHzU/mg1A7APO8fc0qRoMQEqeOiDBjSeurDc8feyHZuXZNstC/awwZ6jZ/GpRJ+qM7bSGquHgcYzoJ9DQ33LRTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CITeQ5ubW4BSZCPVYe38+GmT6rP4MBlNoTgAzbWBaeI=;
 b=gAaNJBgtbex/aoyuut9XZK8ZWrd457PXD2LNN+ve1n3O1TTeul+Kw08IzbxQSMgWoRn+jq86J91N4DTh7eZ2xBa7WFTzxMVH7Sp6+N8WsNkn7l3PTs7PHvFDf2Jk22TfwXaWfa5KPQ4hRh9WGLkLcAM3O+n/Wk9QWSi+ZL5mEgw=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2791.namprd12.prod.outlook.com (2603:10b6:a03:61::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 21:08:57 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 21:08:57 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Big Endian support as multi-ABI (was Re: [PATCH v4 02/15] ARC: ABI
 Implementation)
Thread-Topic: Big Endian support as multi-ABI (was Re: [PATCH v4 02/15] ARC:
 ABI Implementation)
Thread-Index: AQHWB6CXh2O5M9kfy0mEaskESxV7Gg==
Date: Tue, 31 Mar 2020 21:08:57 +0000
Message-ID: <ddb994a4-f3f2-e789-7cc0-5e284076315f@synopsys.com>
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
x-originating-ip: [2601:641:c100:83a0:2878:237:6628:fcbe]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dee86b1b-dcd9-4f40-9e5d-08d7d5b7ba20
x-ms-traffictypediagnostic: BYAPR12MB2791:
x-microsoft-antispam-prvs: <BYAPR12MB27913F593D776A9D6C0DDBBCB6C80@BYAPR12MB2791.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(39860400002)(376002)(396003)(136003)(346002)(71200400001)(2906002)(6512007)(2616005)(6916009)(31686004)(54906003)(316002)(81156014)(8936002)(478600001)(81166006)(966005)(4326008)(8676002)(6506007)(53546011)(5660300002)(186003)(64756008)(31696002)(66556008)(66476007)(66946007)(36756003)(86362001)(6486002)(76116006)(66446008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4cj63mfQMfCHQ52Q2F2Mdnr2OHo5Ak8DmTrpssRYSWaL6aqKT6ORysGfcWTLwab8jYWfFhhpo0sk/9Lkl1ETsVHh80c9xyBeRlCRepEc0Jr5RJbzapFHhizt1z56LVdPHGBtb+xAHCS8LnvJ1L026OlEV53eToz/cI4q3kyTmUNvO3f+/v+T+mMJIRDMQlletnLr19Jkf9rJPpT41HPWDyjRge0EhffXp23ZFsR72SscHA/e3/9dh5RDOW0zX/YcpxxAXI9HZnUfR+zRC9kacUMyOCZ4M6NvDQzZrTZp3hPa6ZuqK3J4ZTHDE12IsdQrTa/BCuCgvjolWD83hIW3TcmGDamSWef+6n4MGAVuc7n1+0K+4zMHqVsz8tOhIILPdZjDlDnta+Bt0omHtIyFm2mMafD6Y2vUq1TSQKf5oP7h6drOIjKagrCp+IUwAUouwa9qeH3O2NsKw8gj0NkW6cYk6DtE/7s55JE77Nt8pxvBHjeFxyyYqFHK10rZtZM0Gzb98Cka11/jm0AzQfB3Bg==
x-ms-exchange-antispam-messagedata: MnfwadiNSg2uAl3n63wYf8XFnUVmBZxU90n2S/82NSmYmUWwHz9/uG6h0W4bXzlUMIdu5UPhmN7ZmAP9KfVAiQQihvWnmimmk5jPQvz5sEtsoGnEMHbOrUnolNLugwprfD8Qxtn1Um/r6II2ORmCjk3gfuF56dBV7c4kkQ9rLYQSg9Mec72xWdks8yBH5/Tg3VuMQC5CQl0CvV2ldS13+g==
x-ms-exchange-transport-forked: True
Content-ID: <09D829B40BC4CA4ABAD89541CEA5F22A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dee86b1b-dcd9-4f40-9e5d-08d7d5b7ba20
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 21:08:57.3266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqGsB/NlbkWO+7YOAjypQoYC3Sd4OJ9/xk3P+eEWZroxzn481XKW8vUUniTj7+gkiu0o3DDJm9HSXEZLOzFlqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2791
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_141013_088068_0D17E1B2 
X-CRM114-Status: GOOD (  16.55  )
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
> Yes, if you want to support BE then it should be documented as supported, 
> it should have its own dynamic linker name (with consequent GCC change 
> required to use that name) and it should have its own build in 
> build-many-glibcs.py.

So I booted the reworked BE support as proper multi-ABI (so abi variants in
sysdeps makefile, configure and ld versions in arc sysdeps ldconfig.h and
shlib-versions

However I'm a bit unsure about other elaborations needed per your comments in [1].
It seems they make sense when disparate ABIs can co-exit. Quoting some lines from [1]

| "support simultaneous presence of
| libraries for two different ABIs on a single system (hard-float and
| soft-float ABIs)..."

| "In cases where libraries for multiple ABIs may be present at once, there
| should be flags defined in sysdeps/generic/ldconfig.h..."

But a BE system can't possibly be mixed with a LE, its not really a multilib case
IMHO and a totally separate software stack build. So things like rewriting ldd to
be able to detect either ABI don't really apply as we need a seperate ldd built
for LE/BE for it to be even exec'ed by Linux kernel.

Going back to the list of needed parts in [1]

> sysdeps ldconfig.h file defining SYSDEP_KNOWN_INTERPRETER_NAMES with all
> the supported dynamic linker names.

Added entries for ARC LE/BE

> flags defined in sysdeps/generic/ldconfig.h to allow such libraries to be
> distinguished in ld.so.cache.

I don't see any other BE entry.

> elf/cache.c should include support for printing a corresponding description
> for those flags.

Ditto.

> sysdeps readelflib.c file that includes code to identify the flags to
> associate with a given shared library.

> sysdeps dl-cache.h defining _dl_cache_check_flags and (given that you
> use directories other than plain lib) add_system_dir.

They seem to be used for 32/64 support and/or different soft/hard float
implementation, but not for BE

> ldd_rewrite_script setting in a sysdeps configure.ac file, pointing to a
> sed script that edits ldd so that ldd installed by glibc build for any ABI
> is able to work properly for binaries of any other ABI that can execute on
> that system.

I don't see the point as it will never need to run.

Again the intent is not to reduce work for myself :-) but to do things right.

Thx,
-Vineet

[1] https://sourceware.org/legacy-ml/libc-alpha/2018-01/msg00008.html
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
