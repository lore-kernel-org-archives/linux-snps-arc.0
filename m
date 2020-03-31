Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3F3C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 22:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8836C2080C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 22:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pwUFuKES";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I4foTZAA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CFZT+sUG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8836C2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4b5V3qvk952FoOfVTN0SztQJzQdSSAe/LoOYOvON/A=; b=pwUFuKESSNWpjR
	Gew4tun5Q8H0qEtBqioBIT5zC78BNiR66077Eu5bUlpXw5+ZIg19BkiHrJL9uwNrpmRU0JTiU9bZ6
	67Ic58t3OQNDwxuqs2P88NkbihNNtl0bJARa/0mEPXJYqT8qUXp1Zxte6BDNn5rP9CvQnJKgfIMiv
	E5PQldM9CwMN0hkYxv2EgkXZLnmxA75a5WM0ktznMEX++qKBQDiDzVbv4XwIMXN1O7uGGSH/lveqP
	jmv5vT4gJj0+9SvgqktP/JUY05RM3DMbZrey29VnCQUT0pK5pVlLfwPdpyBwvBPotypCjxNSgZTXs
	1O/b7wNItGYuRTCDCSTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJOyi-00053C-9S; Tue, 31 Mar 2020 22:03:24 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJOyf-00052b-Go
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 22:03:23 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CFC30C0F6F;
 Tue, 31 Mar 2020 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585692200; bh=bxLpjUTXuVQE/YGPAv76cISzfl77abScwNdwfewdlpw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=I4foTZAAeyVw37moKoC6REeKfZZX2zyStZFQHCRdF01uNk18zFNPUXm6LVSG3afjZ
 W9L8Qc/WLMD/N9ZrNFdFvSgByXXMgid7ozcdJxBLrS4XTa7oF9jj0vnR5Vz3W/M63f
 b8Abryr+Qr5wInupdFC5ywnXI4lVOO0L502+2fAQ+FaDG+0R4nNRv11XkVx98i7LsS
 IitqV86bPJGH4oSxb5bmj3+TFwG4JJvU4/c26ZqcE5IngrTajQf6NR9RWzsaIfQ/Vg
 AydYkzcvLwE4ibfgvo6kiv6JHsT0udiqzXyo6JLzg4gctpj/olPCO9nXDCvL4j9unl
 ip302X2c2Fkeg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6D0B7A006C;
 Tue, 31 Mar 2020 22:03:20 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 15:02:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 15:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLAaCfKWIOXi9RV6ZcjWSDDmmcPiD/y78YDmosc2eJ2ydqpTL6AOb+DfcCn/HVojMjcicXsCNq5huWj8J2RG6Hwu8fvpBBDRRWXsS1gjHFMSaigr8sxfz1UTpdboe0RoBJYSK6oQ5kj5QfknbqokBnYJefFXqizsnVzlTs6oyb5Bxb5IFIxBwWtomF6h6BNAHQfLsoMA7VUoCEEuGxS/pR5lYZ19OSqieLnKCLINcjyKAsrPJh+NDsoZxoc8XwcmT30PFnc6mdrHmhldermFySDFcxmoxlM5gEqxftqLPH9Uh7/KvL68dniQ2IauPJPgnQIMcz+pD2HxMKtBM036OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxLpjUTXuVQE/YGPAv76cISzfl77abScwNdwfewdlpw=;
 b=fQ2X47elWPvNVS2olkqX22GZmKgGhonE4nOdPYhXxCHQkxgQqbtlnZGLw5N47vn2WR36mkyDMkRb/o/zpyjFWavmJTys6R+Mg6BVWmvJWLS6MxGyFZ4q4A6sVHPYhflcOjwnwScle3zckQ1Op6UhepHb5VYShMfs6/qmmHVIXVtbC8XbGHj2Des13i+RhMSE7zP7zrn1L9OpqWvNU6w5nfyVLBABtJkRyPG2y2orRo3g7m16J6WXzfZZKKlDYlUKE8G0Hd0w53ZqXJgVPnLPXgIOdGrEFrg9LUOBDc3Pe2UWWJwoBzbeXHAr5VyFU3gvdqOJgU9BdThIlVBULC2tfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxLpjUTXuVQE/YGPAv76cISzfl77abScwNdwfewdlpw=;
 b=CFZT+sUGKuGAUOqgvCCxWmZgVXd8ekwj5lMBEnIQKEj+K545p4MbynaE+tdF3Fc6conct19JfKSB5TqxrJxLk0d7mvQl8y1itm8dH+J+Llgk/dSc3o5ZThT48t9J3pSrM/yQyCUyIEEyJLVrVgyY6PvQIS6WgOS+qAYVHVXdu3Q=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3317.namprd12.prod.outlook.com (2603:10b6:a03:d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 22:02:00 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 22:02:00 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH v4 13/15] ARC: Build Infrastructure
Thread-Topic: [PATCH v4 13/15] ARC: Build Infrastructure
Thread-Index: AQHWBIm8F++2Uf3ML0i/ZM1l3z8zH6hdjyEAgAW3y4A=
Date: Tue, 31 Mar 2020 22:02:00 +0000
Message-ID: <57eeeac6-75d2-05c9-f1fe-bb642329ca77@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-14-vgupta@synopsys.com>
 <alpine.DEB.2.21.2003272238480.5132@digraph.polyomino.org.uk>
 <86b7b480-da30-3eb4-3e1d-1d8785604770@synopsys.com>
In-Reply-To: <86b7b480-da30-3eb4-3e1d-1d8785604770@synopsys.com>
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
x-ms-office365-filtering-correlation-id: ba29d8ab-0496-415d-7425-08d7d5bf237d
x-ms-traffictypediagnostic: BYAPR12MB3317:
x-microsoft-antispam-prvs: <BYAPR12MB3317450D348DD9696DA4A0CBB6C80@BYAPR12MB3317.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(346002)(136003)(396003)(39860400002)(376002)(186003)(5660300002)(4326008)(31696002)(53546011)(8676002)(86362001)(6486002)(36756003)(66556008)(66476007)(66946007)(6506007)(76116006)(64756008)(66446008)(71200400001)(2906002)(2616005)(8936002)(31686004)(6916009)(81156014)(4744005)(478600001)(6512007)(81166006)(54906003)(316002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rdD5bISmYWAZxXrrKHue7HPJ+pG/uLn+2bLbsxo/mVPD+h4R6acwFh9x4kRJKdId8Basxzw7S9QJjxM7QbOnp1cIAV0y3IUTfdvWjX77NBCZUfatPM6t6NT70RTO++1TWDeVvPO8vFhQOCwX1zLLyJtZNjR/KubMFHvZU6QtoQpsGosG8KL26pmFEa4Qr5QJMjEC/xFXfjIY/6R4gPaeARZFOfjeSqUzXC9of5jpqmn19ia1ipkyylIdslwRq5W6qVNJ4bwZ0F859imIH1mE2Bg2NrhCkhh6yuBytyHtDvsxiqxGWfsIwF61ShpAuPc0gMeOjVc6TKGVXHfC/NXUuCTksBwtNV/vKmKyx0i6C79Y/A2of3/h5c/rnIZDBjbA1s9WFcSmaQDiJ2aZIFL7UCSNxIMatNtnqHfwYyosVw3cee1nCc9s1pHiRu4tuGr/
x-ms-exchange-antispam-messagedata: bDG2K28ba4VjIKstyaczcgs9/kwaex+C/U3TCk7+On78pKE7SOklJEpuNT83T84kpoSvtGfGk3zhUeTiolrRIfF1lEg1RrMMnw9fqrBdO7KU+e0Nj3IjWAc2Kv8K622ymhaUzV11grf3tSD29RrdqTNDEIrRLBX8LvsyEWKQsiHtH6vaKWf1hfGbQk07mfI0mhGQG+5djwdbVdoAJbZk9g==
x-ms-exchange-transport-forked: True
Content-ID: <6175CD0CA596104493FE56728FD16EF3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ba29d8ab-0496-415d-7425-08d7d5bf237d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 22:02:00.5239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4xgtrFfgsru78LaPEWP08HJs+gquhbBVuadzg4+drFIRC8Oa5CtJBGCfXQv8f18K7CgcLY2ccMMY/V4QMX2eVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3317
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_150321_846516_BAF6F719 
X-CRM114-Status: GOOD (  11.04  )
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

On 3/27/20 11:42 PM, Vineet Gupta via Libc-alpha wrote:
>>> +++ b/sysdeps/arc/Versions
>>> @@ -0,0 +1,6 @@
>>> +libc {
>>> +  GLIBC_2.32 {
>>> +    __syscall_error;
>>
>> Why does __syscall_error need a public symbol version?  If it's used by a 
>> library other than libc, that means it needs to be exported at some symbol 
>> version - but it only needs a public version (as opposed to GLIBC_PRIVATE) 
>> if it might be used by user programs linked with glibc (if it's used in 
>> crt*.o, lib*_nonshared.a, or inline functions in installed headers, for 
>> example - or in libgcc.a, libstdc++.a, etc. (GCC static libraries)).
>
> We'll historically I've preferred an out-of-line errno setter in the syscall
> wrappers and those are used in libpthread et all as well but not expected to be
> used by user programs. See my sysdeps.h

Ok so this will not be called directly from user programs, but indeed could end up
in  non shared libs and/or inline functions in headers, so I suppose this is fine ?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
