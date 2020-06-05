Return-Path: <SRS0=Gpdw=7S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F74DC433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jun 2020 04:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 965E8207D3
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jun 2020 04:44:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pIT9eozc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NVtib+T5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I6yiQFRb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 965E8207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRZmOYw+xjbLFWyCKqBkizPvEuNcYvxsSkGnMbEypNM=; b=pIT9eozc5/dhe6
	kJISzShXIVQIMPOcx5SchdQMpCnmcZMlhn6hhlW23FaE0CtzCyC9CLBpXMjUfSCHj4aFopmkBJMq+
	jXi9p0tdBd4i/BgTLTWzV/2pN6VK8+xQCD6e6cy1g3LWrw8gau8UjANpRkgysjgQw/tfd8w+unrv3
	JGMKBwrNEfLcOohF56TeuYdc4W8gHB8MtYCeqnkqNPqteIAmmayh35VZsMY0fUv/Jw2ABCyqSLgdj
	wKu9xg7kuHx4k66w4/1DV64U8vjwyjUtTg3nLrh60X3lKu/lHwCQgBKHBIFcdIUlN6H8xmh6+QMmC
	QfZFqSsoJw/tAbUVdodQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh4DV-000317-Fu; Fri, 05 Jun 2020 04:44:29 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh4DS-00030m-LZ
 for linux-snps-arc@lists.infradead.org; Fri, 05 Jun 2020 04:44:28 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CED78C00C1;
 Fri,  5 Jun 2020 04:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591332264; bh=7WpvEuAi3A1uiq7w0rUCjktb+96Zuw4qXJr/+OdLpjE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=NVtib+T5N8C8MwQ/HYR3xYRS/rsHkqA2XMcRP+t/ANac9/y13HVOgudvFZCc1Yys6
 /WpdeTJMvQEYSZl5IIc2OjtnDVge2zx5Kourtm4giZnpwC3O8WbaknOMirjU/iLo+R
 D9I7C7zYWKMzaA9ZYNXTyXtFpNG/ObmEEqtunY5sQbSp/xaYBq3ux10Vl7/Z6to1Kd
 2sZgBKz2sENF7k/H1tN+pOXpw/7cbYusRcSDxK6BBajDPP3hXp+ddLGzoKUdwpV3pS
 nFkzqlYwfxYJbx+1viYIKozssGfg3Q+OjewEfK5SnKlBiNABHlOkese8zmhftr9CgC
 vYH1QzrGw0zIQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 129AAA006D;
 Fri,  5 Jun 2020 04:44:23 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 4 Jun 2020 21:44:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 4 Jun 2020 21:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntI7VA/E9lkKsxPlIriAw06SNqZC4e9V76n5tboG7Jd03pLZvwNjpgq/NNNchVwJSmlF4/XL+Hsgx3S9r/2abgK6KrzealE0FTfRPvJVz1sI7FN59yKO1zgJ58rN5p5QucERAJwPeSvr9l77dtDtcHkiyUzuLyAF+TZPu8clegnqF1tqriV5WimQs9CCCG5yQ/eCrFznCWGisAClfMxPYQzgReQrXEQ2Zr0XRPoY09u+K0k4NHcc52k/zyPi3r+RnIZo2Ew8/oHy84pw0WOT0dpxb0n0O1mVr1mfLOuPGTwL+cEZd8au7y9TZcBvF7z5lC5BaxYGDZnX8l03bvjzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WpvEuAi3A1uiq7w0rUCjktb+96Zuw4qXJr/+OdLpjE=;
 b=HBLxuK4Uu0uJ1Y8MghH8mNp2YaT0TkYgtIus8xL87WmTINf4sT64mdi2e4YGGJj6VgOiwrKjdfRCmkVMIPT5N3HDdd5mPAmz59eZ9keDJZBDhpmAYjXFjSFuptlKtMusjr0x1/WV6qBy4+QWMkiZaGDBHobbyCYEsJ5d3zBXJ859T1SspDdi/aKhiYviiYobKi0oFxya+gSnqBz+vGQguOMeNhrcURwDPSFibm5ylDFUZfK5N2eJlrvLYVg1vEP0Gq79wN7Un/4o22IxVBoWFRY1D+YoMyTHwhqgOZ2dZvgmw+sLpi6oiIJnA6sJg+XCkTDi9NKoi9RNL7y8wrkr3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WpvEuAi3A1uiq7w0rUCjktb+96Zuw4qXJr/+OdLpjE=;
 b=I6yiQFRbmVU+cCtvide25ZWgLG5noV+r0wzpV5ro9O7wXLhWa9nu5GH1KV4afR+sCuY7W5JsDswRnZjC2vxVAmb4TUpODxIIv1I2sTC//tnEJXkVXGRIz9NwLChJP7ggRUAyWxnogf4rm5zJvdujYTvr0+6rCbIugOTCX+UUSUo=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2952.namprd12.prod.outlook.com (2603:10b6:a03:13b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Fri, 5 Jun
 2020 04:44:21 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 04:44:21 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Subject: Re: [PATCH v6 06/13] ARC: hardware floating point support
Thread-Topic: [PATCH v6 06/13] ARC: hardware floating point support
Thread-Index: AQHWNcNXJXMgGASM2kSQaj0x3NFlH6i/pXMAgAAW5ACACcAVgA==
Date: Fri, 5 Jun 2020 04:44:21 +0000
Message-ID: <214245c7-c89b-22bf-25db-fc9148ac5f92@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-7-vgupta@synopsys.com>
 <de8975a0-bb03-8cec-be97-56f8c4e2a2f3@linaro.org>
 <91c2aba8-bff5-5ddc-7a95-c93c90883150@synopsys.com>
 <5b06914d-acb3-4404-4ff2-93bb7a04f8f5@synopsys.com>
In-Reply-To: <5b06914d-acb3-4404-4ff2-93bb7a04f8f5@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:2f8b:62c8:4c97:a7a2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46e8d93e-9f30-4ca9-de81-08d8090b1d46
x-ms-traffictypediagnostic: BYAPR12MB2952:
x-microsoft-antispam-prvs: <BYAPR12MB295253764A9363DE3325886CB6860@BYAPR12MB2952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0425A67DEF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fygmGAOrObAPQGm4CRMeciKONJnAGHspGxgTEEusPrF8CUy+eryhncLupzq7g3uLOEi6yzKv08mnfXT3FHKrp4B35LEABrJBoh9SmkHXI9+fOsJxr8wEYQ1P4PQpCH9i3+JSfx6x3aTwfzc8ljdhCGY94tl/UJ14I99RyUuolJe0AVrftPkqjhF6z0qhFzscsDlTD0AMLVjk0BInr5XuF/8jvaWDRwYFCaAU+dOLohZHgL1WG3eU6vj2hwiDdg8m+UWeln/nFKjox/UkDIrJ6ATYuQYr9ZrjKw2zlT+hhSIC2P/5XztvTAXOUjJsPA1Ze7UW5OXuUJLyZqAkEdNkEJeD53cJp3VpfKwMiCoo7mNDG5XVBIlHqqW+2gjU9lEq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(346002)(136003)(396003)(39860400002)(76116006)(8676002)(110136005)(66476007)(64756008)(71200400001)(66946007)(66556008)(66446008)(478600001)(8936002)(316002)(31696002)(86362001)(4326008)(2906002)(31686004)(5660300002)(6512007)(186003)(53546011)(6486002)(6506007)(2616005)(36756003)(83380400001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WawBnyz//LILjXsTM2qKtBSN+35WZW3vT58AaskmvU5QXW1oGodFubOK1gyJwqNFdt8cdNuG5IE7X4B6eFTAViU7C3ju9Owy5Nr9w+b57LZBR8ICL8I+1LnhoDgCrZ2TXYx3shzYnrLqZFuSn7kEcL2AYwr11U9O52zb3Jgs1twOeg1YgjCIN3C+o3skzRhZDj601RtAMJBmhM41TK6NUP5ehB0imFHDgsA6CgoGUJF3wQDJc0bKGz/8lB4dGizGqP/8s9OwP1Sf8qIyh7MNK34ZCUdXzpGOjRARx90Wjs37SD4BRvjsuZ3y546bOWNo9vX5fi1R7BUwTUuJAME6zgeA+8tILDb4FwjD8OmOCFfDpnwj90abY1lddcIh2jTzuWVT1XDbzssb1gZmgyXv7mHrKGcOvJ0llgo+AXoujfyNMy/287mjT+H1dA9pisq3PUcfzxdJCBa31VGDziNyTbPajAGAWnGLZYCpv1I6D2726dmp4XNAIID49/L8KsZXCEGz+tRw3hmwoAOXxfvY2xyEMGyFIK1kZJems7K282UnqDw3A153Ak9iM6T0Kp33
x-ms-exchange-transport-forked: True
Content-ID: <0A1B1143883B75419096FD959912BDAD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e8d93e-9f30-4ca9-de81-08d8090b1d46
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2020 04:44:21.2249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0TI65fvMSMMJUfYyMNaR67vWipae6U+Cmb99aqIG2Sg5RNo2uWotWJ0G2vIWwiUsnC0Bp13LGM1HgSByjtOKtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2952
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_214426_850462_BA71B9FE 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/29/20 4:50 PM, Vineet Gupta via Libc-alpha wrote:
>>> Although this code follow other architectures, I think it woudl be better
>>> to move forward a macro that emulates function calls and use proper
>>> static inline function instead for _FPU_* (as for get-rounding-mode.h).
>> OK. do you have a preference for names, existing upper case names OK ?
> Something like below ?
> 
> +# define _FPU_FPSR_FWE		0x80000000
> +
> -#  define _FPU_GETCW(cw) __asm__ volatile ("lr %0, [0x300]" : "=r" (cw))
> -#  define _FPU_SETCW(cw) __asm__ volatile ("sr %0, [0x300]" : : "r" (cw))
> +static inline unsigned int arc_fpu_getcw(void)
> +{
> +  unsigned int cw;
> +  __asm__ volatile ("lr %0, [0x300]" : "=r" (cw));
> +  return cw;
> +}
> +
> +static inline void arc_fpu_setcw(unsigned int cw)
> +{
> +  __asm__ volatile ("sr %0, [0x300]" : : "r" (cw));
> +}

It seems there is more discussiosn to be had here. Can we just punt on this
specific item and keep the status quo macros please. We are heading towards july
and I'd rather have the port go in this cycle !

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
