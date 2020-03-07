Return-Path: <SRS0=vrW9=4Y=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED06BC10DCE
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9607206E2
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Mar 2020 00:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iYI1C0m7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lFVgHsmS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="nBszsIeU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9607206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VYj45IWqX6A64k+uTwXAAMtrL0xUHGkzKvDRRVjY/g=; b=iYI1C0m7kzHo0z
	R9fdiYB6Rki36abaQe9tCwgpEu4oJu5VGRU7jO5DjPbcQ/i6fWawSSfGm0WipmtxCQCNmXaR+rsx+
	fR79DRfTffFDIGWuoaVgP/plyd+sHLWpzQFYNn/P7hIzePlOpMEW8PvLB9Mf6DgOMNy25RjVXVBHt
	TdpF7gmOTlPzpaAjhS4AMlMO4LwG0UbgtLhUq/d9hp9vv1KIk7Nr7mNhR0p/xL1BM1XqF3cxLD0da
	gjZYIHE0dwyFH+pw4gN0Ry+G8kHBYgzRCsNiD1MMVYuCPvXMJ4mXhqos8RbP4sRYxADXAJGVYQQzt
	c9l46CcWtrAGGLkyP0Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jANEg-00006U-EC; Sat, 07 Mar 2020 00:22:34 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jANEe-00005u-AJ
 for linux-snps-arc@lists.infradead.org; Sat, 07 Mar 2020 00:22:33 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 69C0CC00B0;
 Sat,  7 Mar 2020 00:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583540550; bh=Jcv4tuPNRoVicpntvbgnglg/bYmYAjN0mJkGwC6TtaI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lFVgHsmSKd6Io6YYOTgNhkBWTCCuod3sa5jfX8VsNLV8fmLbyLqyK5u7jmB6rCVn7
 gDpQlQ167FEeTZhs+keBJ17cQidLlxKAUHI/A96efV48DfogeHl0BWvdPEjBrADOBg
 Por5XWRmYR4APBjLo/t1jUPb9ea2kW5cNlke1cLAugz2jegG775ydt72NiVdyGuSJD
 H9GyzbYVp1a88GQAn8blrEMDDRrcOvnX9rRjTiZs7W7lIvFe8hXltnhOn1uB+VcU0q
 OH7dDtgDKat0gD49bLehuPUpxcNubaS+MkrOP9bHAgWCJ+mZjj9Jjj050kaGaZfJMZ
 BhQx9bBLwVHIg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A0F6DA0091;
 Sat,  7 Mar 2020 00:22:17 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 6 Mar 2020 16:21:56 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 6 Mar 2020 16:21:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVg/cHGiURtfA35hQwBpAjzT5JfjuQWjTxGD6jmFRnPysspE2vXDu0KwgQWd0d3eK1TJkCPwGSi4zkAepc+DAF07xplJQOstMAZvMOk3LmBjB+prMiGK6/bxOkgSBLYh89B3lL5nJzCTb0YJYMhcEZQze4E6poWdCzqQ3krkL0Xo63NwC8yFj/w4jScmkC5OEmvtyi8Zt8DeEOi3PpF/Imj62gpeIKmkyiI8AnuCB62/nnjhWnpOYQABupJxa2uvd2qvZFdPgrM6UMOh8GQWh86FG+HBi7rRkOx9xpa7pCV/M0Fk9r6B0zEt6naeFY4s6Cr7OV9/uUGzuuzXoVVjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jcv4tuPNRoVicpntvbgnglg/bYmYAjN0mJkGwC6TtaI=;
 b=YEaE3d7DlbnK8NfREzBGF6+vUms8InoIt9cH552q6HXqPZzoWcK8ITedEdsTRZjkBHdXYDgs2cp/j+/MbJ5b8p2D79oFCYzfpy752RddwYIeLSuleVX6G/SCYORJXAzC3Sx/EJUHbSKmgGPwqCBHRifoV5HB5iH0RW4A7dZyd76lbYFcxm+dkSdkCynKn4z9TsW5Mfy5Bc+f6jYfdYPs2KhDVaBql3v6ImZp9ztKddFhoNFuqbWrd7ahucq3UHORkG9BY487ga+GQMy9kKuI7vokq4QcsjCbMwKBWVAEeeKCsKFIstkwtAoSpkguHTib+yKxuyVzg/bgp3glZvt7HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jcv4tuPNRoVicpntvbgnglg/bYmYAjN0mJkGwC6TtaI=;
 b=nBszsIeU1slBiqddn41Na5CPqDPYI1LEYAR/UrBc6Vzm4mf85xgR5yst8kB0y1HkEslPzuTLbUdgEh+ke6SdaueAb84j5M89055GbGoKve5BVzVZaYSOsxhNLuQFVGm/t8c1Wf0PlGDjNHe0KaPgMgnWGsj1BGbeGljDgvoH83U=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3109.namprd12.prod.outlook.com (2603:10b6:a03:db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.16; Sat, 7 Mar
 2020 00:21:54 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Sat, 7 Mar 2020
 00:21:54 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v3 01/17] gcc PR 88409: miscompilation due to missing cc
 clobber in longlong.h macros
Thread-Topic: [PATCH v3 01/17] gcc PR 88409: miscompilation due to missing cc
 clobber in longlong.h macros
Thread-Index: AQHV8+SJXv7QJLPD1027bpIa0jrVd6g8Qm2AgAAClgA=
Date: Sat, 7 Mar 2020 00:21:54 +0000
Message-ID: <c44fbf35-1033-455b-55b4-774b9a680e72@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
 <20200306182419.13945-2-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003070012230.26274@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2003070012230.26274@digraph.polyomino.org.uk>
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
x-ms-office365-filtering-correlation-id: 2a2a754c-d8db-4480-a88d-08d7c22d8a3f
x-ms-traffictypediagnostic: BYAPR12MB3109:
x-microsoft-antispam-prvs: <BYAPR12MB3109BE6531C382AA88FDBD50B6E00@BYAPR12MB3109.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03355EE97E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(366004)(136003)(376002)(396003)(199004)(189003)(5660300002)(26005)(4744005)(6916009)(6512007)(81166006)(71200400001)(81156014)(53546011)(8676002)(64756008)(186003)(76116006)(316002)(66476007)(66946007)(2616005)(66556008)(31696002)(54906003)(66446008)(36756003)(86362001)(6506007)(6486002)(4326008)(31686004)(478600001)(2906002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3109;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pQRlsc5ibhunEaeQ4LrjyOpew3bcWTLcN+i3+aSWdKiIjBbHn3SJMCGZwE/9fDc/k05Z08ZqMzG7gDKyVvVnmDSN0WgspMDs0zxPZnbEAHJYL7yWHM3/IN2Nf6y/+DEHo2aPA4vp3w4lxSIfiI8aYmX1SgS1SB9b6Y0r16IqVhFr1AcFdWQK4RKz0PhEXlep8egNoeG7U9PKl4bvjTtK/slwLNMuIt46VdQVyRn4aZJbEXIeHTnfgI+2HCtMzknNj6e/0KGCKgfCNWCT7tHpU2VD6el+wOvzc9eZsa9Oeu/4IhFqsvrLKj8T6WPElwbZl7zarqo2r5u1A1ABBrLq44Y3eu7e+DoDowADVVqRI//v0eWdNQ1jZvW0Imtukpmt7b/VFaFXYZj6kKZPwS2QpK/esbq2trnzGQWsjgKsSDI7EOWVdAJXG46QNxqEkLC3
x-ms-exchange-antispam-messagedata: cYDdULc2DSt6ORwFUlI1vZAunSukIQMIj4KuPwsvbJwsvUc5hDK8hmRzH/TFwPAXDewmLjRIIlxyfFx6COvQQ6SkWxaWR4BjioogqkdoYoiCKR2zGx6elACDe83MktGwgKPFn4m2QfHj1K1qk3fjIg==
x-ms-exchange-transport-forked: True
Content-ID: <33BB6B9322644948B570945295B21BAF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2a754c-d8db-4480-a88d-08d7c22d8a3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2020 00:21:54.3529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k27RyBHHfeu7sWS38mkYjZYtG1JhHkKLU047Yue6LNsNnFuHpN/szFh1S4CymfT8Uo4jp2yMsR2JIVDUlAHeOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3109
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_162232_425336_F89CF397 
X-CRM114-Status: UNSURE (   9.24  )
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

On 3/6/20 4:12 PM, Joseph Myers wrote:
> If this gets longlong.h back in sync with changes made in the GCC version, 
> then please commit.

Yes it does. The only differences now are in the initial licensing header due to
glibc's variant bumping year and the http -> https.

BTW, I don't think I asked for commit access before. I just rechecked MAINTAINERS
wiki page and seems like someone needs to grant me that.

Thx for taking a look.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
