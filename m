Return-Path: <SRS0=waOV=EM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCA0C55179
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Nov 2020 20:27:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82CC208C7
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Nov 2020 20:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jCflpyRd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HWhGXwDJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="f2p9rAro"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C82CC208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C+aCHCL742HIapyAT7jZreSBjRxuMgOslrUU321QDrg=; b=jCflpyRd5Sh9Ndq4rJ5K1EeL4
	5HLEzd/Q7J/xKAA4vZpU79tVGIPdGlF5HR/KDPCoP555NU/yZw1IdLVTXXrNqZs6/pDtL5aGMy8bt
	9JU0fZUdES7b+e1Ckj1s1jAklgdHWZjCbW7NdpYE78gwaxo2Z+cjFWDPXZH3ephz4E4PgRG0Nrvq9
	sFWnvqlKT79CZ1ZJWzWvuQJ2Ufa7c6ZQP969BgugF8JoDPHte/IIxY3js9pRmotZM4civ4Cn2/FGi
	Jvii4njc4IpC1Ygk7IflGeeT9ZLlBFEhUg6VG5/8lzyrgV5Uw89WpZ34HPuTsRUnoBGVkIZXbVmx1
	1xtuc2xdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb8Kx-0006t2-EF; Fri, 06 Nov 2020 20:27:55 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb8Kv-0006sI-4Y
 for linux-snps-arc@lists.infradead.org; Fri, 06 Nov 2020 20:27:54 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A2710C0344;
 Fri,  6 Nov 2020 20:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1604694471; bh=a6KY4C43XvchpirgUitxGKFFPB7MG3vs4MgouK110c0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=HWhGXwDJroh5XmfWy+oEV6q27tyLI0kv471fL0Tm3hsAwGgIR+IiUe/banc4Af22J
 gXy3UxWuVJldYwEfjvSbgV3nd64LBAPyDuevulRy66mDDrKOunnhO+lgJKkpU1Qd8y
 nIAbIVdoJ2UD2Xc79lic0tOuaHf1KpccPnXQPunogfA7XpV07SfF5tOYTUzoi1V2Ud
 M3t5NBYoKEbto16BjqVTdfdnddsDPPTSS1ZDCLlaxHlV9jroY3WoBHWHLfVhB9F8jY
 ssuA9EDsxbcOKO5dCKFn+TVeUlN7f0lQYtmSTImcUaMCWNW2O0ndEzhELghPKv93JB
 dRI1Iwn3icwOQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D5534A0084;
 Fri,  6 Nov 2020 20:27:48 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 94B66800C8;
 Fri,  6 Nov 2020 20:27:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="f2p9rAro";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfzZyimI7Ui68DapLp5KvWRppXzLnYKE2X9jrmag2xrR2BdTeoRxwU44veYJGh/LRLboaTqBP55Rtt/uE46vXnZApkfIdb0lKFegojUj8NlknkPqDIvBReh+dGMocLr4CD+XWQCms2U6PA4JRS0IozP19ip3hi/wmsOU6Sfgt9ia0FKuUA5aVokQhubETYsKPIInYtiqzXFtyzLnjo54rGwmm/SXiab1y9eSka3OC8JJ0QSa0TA+rvY0ghoAsc5yzL0GTv57Jmlw2JLaGoMdHKgfqe4nkr4ohs4XLcCs7IGaqlJKojVCohb903P1Z+qCdNTzn19Iinn2IPs+H+eXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6KY4C43XvchpirgUitxGKFFPB7MG3vs4MgouK110c0=;
 b=ZK3sIl5mJU16bqraq+z7ymkKx22d7haUt1XzANb9o4fJvtymiUVJLY1wizjxg2Bx6XrBH1S7kuAC7ZU1e4gYwCbB8jxLjHEXWUO2SaIP/5L8Na8U5LZyrgH4u3DbcP9DmgnrC6+TPwFaflweUN1zsYdaMk3cuiZfx2zDE/vBbuwI+YUQYHSscepS3AyAXsI4F/PRFGMtIbaoiNZfEFE3XLxDsRr+akqjXI92bMINkaZ25pNRhKqujYzB2kIH4WBFJeOzR44VckttWQJYaH2GbD4PuuSibkB9XHqCOsxDzTxA9YF+k2JCrc0NgXM4Mhw2IzC+73jLuLae4fHdFUcpSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6KY4C43XvchpirgUitxGKFFPB7MG3vs4MgouK110c0=;
 b=f2p9rArooz7oZWbc4zmJbVdwAFVA5xNBc9yz7rrI/e6NjbZGRMhfkOzeQ62/rv7tOWUc0iUsCl4qUiUl6xAw6/4i7kGDZi8b4E1VPxZ8yxGBMM/7N0/Z8JvnZdN+v3Keid+PMIAcPcF6Ni/VFPaHr1GxEP5Onv8P49aQzZgqL3Q=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 20:27:45 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3541.021; Fri, 6 Nov 2020
 20:27:44 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Revert "ARC: entry: fix potential EFA clobber when
 TIF_SYSCALL_TRACE"
Thread-Topic: [PATCH] Revert "ARC: entry: fix potential EFA clobber when
 TIF_SYSCALL_TRACE"
Thread-Index: AQHWpoeFs2lAESMsXEi9RfDQ8a2iPKm7qYCA
Date: Fri, 6 Nov 2020 20:27:44 +0000
Message-ID: <9cec26bd-6839-b90d-9bda-44936457e883@synopsys.com>
References: <20201020021957.1260521-1-vgupta@synopsys.com>
In-Reply-To: <20201020021957.1260521-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d52aaf7c-2aa9-4ea3-1faf-08d882926b4d
x-ms-traffictypediagnostic: BY5PR12MB4257:
x-microsoft-antispam-prvs: <BY5PR12MB42578FC5F05E5348700FBCA1B6ED0@BY5PR12MB4257.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cEjCbGmP/pEna8fQ+1UIIz7Rf3yPPliUsOeFnVH3x2ODTDPaQpYEIYTj/utPIXF00VQEPNro5M2srskX5FyDtsuC98Tq3eWR5shr2GHOZjjefO5+ESSWydjRuCMx/yayai8SRjk6bJPOG4o/DPgsfxJuiQHAP2/ocfXUjuo4o4PJ4ckgyQpEG1s7goBhxMUX57Jdo5rm500rD8CwNCjj2EExkgWQu0ACDIuAWY/+RWo2Jy5qh4SdmhR/PYHsS0sjkVFtypYdarXTwOGRW7tlJ7zlQ1zSH+n1kB34paStpJCO1bZJXtsR1PT1A8wQR2LTiCEssKoHil9w4PLeZrRFY3Iz9wNGmJIe/ItBwRAzqZ09BYXTiSb/dZhwQ3VvURU5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(8676002)(64756008)(66476007)(66556008)(5660300002)(31696002)(86362001)(31686004)(2616005)(316002)(66946007)(66446008)(110136005)(478600001)(8936002)(71200400001)(54906003)(76116006)(2906002)(6506007)(4326008)(26005)(6512007)(83380400001)(36756003)(186003)(6486002)(53546011)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 9gz9iu4sJgo/J2PNuYfZuoNT9vJgbUzylczKlN957EeiYfghbHYDEMQq8Dkj7QOI/P2rTUicVMFPH9v5LUBWbTPKiwN+DRkeRKLsXldty8/dCoiaGEcFCS0xETOUWWRO7uLyVSpHF+3Zy7WBVDuxLQisSoZc36kFjM2rTbr63hwI65llO2KbE4jkWZoJ4d5U+XPpLC8tz9JxiKDJI9g7g9w/7O3mx2j0hYGuzTCcAuh97/mnVLe8xRZiqjolYT4P2vQnzBbbymR1CEzobrHf7CK51GUDtEMBES+ndVWfpvrFjax1yR9k7X20tXZJ+5z5F8+Tm8fVpqbJdFULo5y+7lD1KX20kEeJFXy5fnObR6EQwX1+ek2BujA3imEO0GieWWCMpqzxNeCgmiRsQ/M5NGIoXJlW4IJAcACxKMd7tcXfUHkUgQNfH/E6F5VZstAC9VZ4QJshwbA6tGx6aVadecDFPGUfXlmcBFHINt2hd5dDsDdm7ddBf55fTsPVu95AJuS55n+8Fb7qb0rCPhuqTyiASJuJA8Fp0ZRBwBbrafsaShLARj8+LQ/+zzIbrr5Cfi7BgNkls5k2kIDWv4WRHR8dIMDsNmqECTLcH4E3CHaNXApK/3o5B/Gd6HmEvUa+/s/Wdzl/FDkYTxGQPQ3Dww==
x-ms-exchange-transport-forked: True
Content-ID: <06712E46A88E9E4DBE1F370BA65AA0C5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52aaf7c-2aa9-4ea3-1faf-08d882926b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 20:27:44.9138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +1YHQ1WU042Dmsklr4N3UwAgAGmIrYQQaUCL/XOeKDDUqNplJTJ+Z1nZWYRGZXUR8amp48qS3i2OaULBhxOMwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_152753_600585_8FB2E78F 
X-CRM114-Status: GOOD (  27.23  )
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
Cc: Waldemar Brodkorb <wbx@uclibc-ng.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Stable Team,

On 10/19/20 7:19 PM, Vineet Gupta wrote:
> This reverts commit 00fdec98d9881bf5173af09aebd353ab3b9ac729.
> (but only from 5.2 and prior kernels)
> 
> The original commit was a preventive fix based on code-review and was
> auto-picked for stable back-port (for better or worse).
> It was OK for v5.3+ kernels, but turned up needing an implicit change
> 68e5c6f073bcf70 "(ARC: entry: EV_Trap expects r10 (vs. r9) to have
>  exception cause)" merged in v5.3 which itself was not backported.
> So to summarize the stable backport of this patch for v5.2 and prior
> kernels is busted and it won't boot.
> 
> The obvious solution is backport 68e5c6f073bcf70 but that is a pain as
> it doesn't revert cleanly and each of affected kernels (so far v4.19,
> v4.14, v4.9, v4.4) needs a slightly different massaged varaint.
> So the easier fix is to simply revert the backport from 5.2 and prior.
> The issue was not a big deal as it would cause strace to sporadically
> not work correctly.
> 
> Waldemar Brodkorb first reported this when running ARC uClibc regressions
> on latest stable kernels (with offending backport). Once he bisected it,
> the analysis was trivial, so thx to him for this.
> 
> Reported-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> Bisected-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> Cc: stable <stable@vger.kernel.org> # 5.2 and prior
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Can this revert be please applied to 4.19 and older kernels for the next cycle.

Or is there is a procedural issue given this revert is not in mainline. I've
described the issue in detail above so if there's a better/desirable way of
reverting it from backports, please let me know.

Thx,

> ---
>  arch/arc/kernel/entry.S | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
> index ea00c8a17f07..60406ec62eb8 100644
> --- a/arch/arc/kernel/entry.S
> +++ b/arch/arc/kernel/entry.S
> @@ -165,6 +165,7 @@ END(EV_Extension)
>  tracesys:
>  	; save EFA in case tracer wants the PC of traced task
>  	; using ERET won't work since next-PC has already committed
> +	lr  r12, [efa]
>  	GET_CURR_TASK_FIELD_PTR   TASK_THREAD, r11
>  	st  r12, [r11, THREAD_FAULT_ADDR]	; thread.fault_address
>  
> @@ -207,9 +208,15 @@ tracesys_exit:
>  ; Breakpoint TRAP
>  ; ---------------------------------------------
>  trap_with_param:
> -	mov r0, r12	; EFA in case ptracer/gdb wants stop_pc
> +
> +	; stop_pc info by gdb needs this info
> +	lr  r0, [efa]
>  	mov r1, sp
>  
> +	; Now that we have read EFA, it is safe to do "fake" rtie
> +	;   and get out of CPU exception mode
> +	FAKE_RET_FROM_EXCPN
> +
>  	; Save callee regs in case gdb wants to have a look
>  	; SP will grow up by size of CALLEE Reg-File
>  	; NOTE: clobbers r12
> @@ -236,10 +243,6 @@ ENTRY(EV_Trap)
>  
>  	EXCEPTION_PROLOGUE
>  
> -	lr  r12, [efa]
> -
> -	FAKE_RET_FROM_EXCPN
> -
>  	;============ TRAP 1   :breakpoints
>  	; Check ECR for trap with arg (PROLOGUE ensures r10 has ECR)
>  	bmsk.f 0, r10, 7
> @@ -247,6 +250,9 @@ ENTRY(EV_Trap)
>  
>  	;============ TRAP  (no param): syscall top level
>  
> +	; First return from Exception to pure K mode (Exception/IRQs renabled)
> +	FAKE_RET_FROM_EXCPN
> +
>  	; If syscall tracing ongoing, invoke pre-post-hooks
>  	GET_CURR_THR_INFO_FLAGS   r10
>  	btst r10, TIF_SYSCALL_TRACE
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
