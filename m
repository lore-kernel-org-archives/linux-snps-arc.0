Return-Path: <SRS0=z5VF=YL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97FFCA9EA9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 19:07:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1132070B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 19:07:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kdIRAFAg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oF/KNj3J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE1132070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTVy3jG3+FuR5XBaFuZAB07ADFeKB1FdQyNN1FwSzvQ=; b=kdIRAFAgZeUbV3
	/r8+YbZq3+3YeS3MOujJmM6EIwTRPIZ3CDuSe8ZSDv15YCeX3DQmmSrV1KHXn6/HV+2ZZ/uNyeFlP
	PhBuOOZ0uS/nhF3O+hfwq+soaltklAcvCp3NtCfNse6xBW4TJD1TCQAUEEgWCUqSeyOKWsZcAEtUr
	pQv2Gg/d0LXdvBTPl0YlJxE4mE7rjrm/mgty/RVZBUn4h8cCSUOLFzrk+tf/RRjtpqndguDCSp6tH
	Az1Z0dzGTLW4Kwor26A855U+l1JnliEuO8iREvBu9ht9gPmUxwhuJxLF7Xsdlvx84QdU5eKKhdqoo
	8/2diQK9lD6RNeiHXLvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLXbH-0000As-2K; Fri, 18 Oct 2019 19:07:47 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLXb9-0008TF-3q
 for linux-snps-arc@lists.infradead.org; Fri, 18 Oct 2019 19:07:40 +0000
Received: by mail-pf1-x441.google.com with SMTP id 205so4443963pfw.2
 for <linux-snps-arc@lists.infradead.org>; Fri, 18 Oct 2019 12:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=30FMbBkGCp8UPGjQaUiqtbW+1UIqIwPcEhlJP3eledA=;
 b=oF/KNj3JtEkPHfxXbMp6Q7Xg8Gck1hWjUS1bLdCr+txmJ5SRsJ1FKGjRf2nqYAlMqM
 46XhWXi6D1cZW9MrergOeH5EogA0y6xRHDF53N32SRi2Gkxu46FCvU/lf+/huIdEZuzL
 AtmK5FAQN8beJxXla+LpCLwBz3JVemW/hoB/K6FsLWPKi2dEM68J5kQ0xV2jH1Ih+e9K
 NwVUAm1eRWJZGB/YCk08/XhImM8Yxa/ZLL2ycCPkbAfN2JuLUizKqo9BGndw0jrey7xG
 E0MNV/1QawEdpYZ6sWJR//vppCQ3tj/ek1NOzzQ2AhHDjxmqON/cc8IZ5X2u0Kol9oM9
 GO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=30FMbBkGCp8UPGjQaUiqtbW+1UIqIwPcEhlJP3eledA=;
 b=g7bOBzKVjCLX9BEuo4TZVeR9LpN/xcYBzF/iGk+c2vbLZgFAANdmAbXa74pj667/f6
 YUSI9AddU/oT6FRi6D2WSmT8E/L65kZm0jzcv9UR26hoSSlI633ZWUAYWVxU1TV2bPDS
 OXtNoadJWyrbSKI9juMbJUHOicUu7fFM1NpTKBfpg6q5Xl7HpadFvqqx+yrvQUDOPijP
 dOtOD1J7j/nDl+yuwJjk56RxtOv8fAFWzJtCnMnxhpJme8GPBI1K9htUrHM6bs0lH/71
 GdzEhcwNon0ZlJNj1O7ZRFZ28dO3mbpPfRviYDz5eFeYFSsMZDen3bK5fwNX2VmGh6Lh
 9S7Q==
X-Gm-Message-State: APjAAAUT7/eNN9JyVt/Q47tX+kGMVmJ4YQAURpRIGEYtdkAR22q/3Ztc
 cQpWHz92IfRo4+anMGoCbM8=
X-Google-Smtp-Source: APXvYqxrLjt2N8E3cmxansJuxZRxIRoEzFTZHOZGEVTztaZNRP1Dt6K3BICr2ClhTG4yhioGzUyWdA==
X-Received: by 2002:a63:c411:: with SMTP id h17mr11616938pgd.360.1571425658413; 
 Fri, 18 Oct 2019 12:07:38 -0700 (PDT)
Received: from [192.168.110.119] ([198.182.47.47])
 by smtp.gmail.com with ESMTPSA id l3sm5969514pgi.57.2019.10.18.12.07.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Oct 2019 12:07:37 -0700 (PDT)
Subject: Re: [RFC 6/6] ARC: merge HAPS-HS with nSIM-HS configs
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 linux-snps-arc@lists.infradead.org
References: <20191018121545.8907-1-Eugeniy.Paltsev@synopsys.com>
 <20191018121545.8907-7-Eugeniy.Paltsev@synopsys.com>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <e5dc1e2b-94dc-6c0d-7e01-31cd952a56cf@gmail.com>
Date: Fri, 18 Oct 2019 12:07:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018121545.8907-7-Eugeniy.Paltsev@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_120739_214647_94CE3C2F 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/18/19 5:15 AM, Eugeniy Paltsev wrote:
> Starting from nSIM 2019.06 is possible to use DW UART
> instead of ARC UART. That allows us to merge
> "nsim_hs" with "haps_hs" and "nsim_hs_smp" with "haps_hs_smp"
> mith minor changes which were done in previous commits.
> 
> We eliminate nsim_hs_defconfig and nsim_hs_smp_defconfig
> and leave haps_hs_defconfig and haps_hs_smp_defconfig
> which can be used on HAPS / nSIM / ZEBU / QEMU platforms
> without additionall changes in Linux kernel.
> 
> For nSIM we should now use UART property values
> "-prop=nsim_mem-dev=uart0,kind=dwuart,base=0xf0000000"
> instead of previously used
> "-prop=nsim_mem-dev=uart0,base=0xc0fc1000"
> "use_connect" and "irq" values of UART property remains untouched.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  arch/arc/boot/dts/nsim_hs.dts          | 67 --------------------------
>  arch/arc/boot/dts/nsim_hs_idu.dts      | 65 -------------------------
>  arch/arc/configs/nsim_hs_defconfig     | 56 ---------------------
>  arch/arc/configs/nsim_hs_smp_defconfig | 54 ---------------------
>  arch/arc/plat-sim/platform.c           |  1 -

You also need to update KBUILD_DEFCONFIG to use the haps defconfig now.

Also perhaps as an addon change switch nsim_700_defconfig to dwuart too for
consistent uart settings for all processor builds in kernel/nsim (otherwise you
need to document this disparity in various github wiki pages)

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
