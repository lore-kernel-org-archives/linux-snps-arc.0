Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B370C4167B
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Dec 2023 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TagrNw/ODbvvZYt4CuX8o0p9wKyiqSX+VSS6X1pCFjI=; b=xwGl5WawSPOEFZ
	g2ekt+wu4zFHCNj8squTRUoVrfdG2SfhlVBx6KnO1U+GZ2BQPsKA35S91fwVpumTU8SjZpuS3rx4m
	nTH9CeuL3Ec1YzQFtuHRa9kP6VfeJxw8ck7k4Swtrow/72eh/KqSaBgXnz5zlQFJc3T2xcp032JJJ
	RUy88z07LXAUssj6naN4RUiFCPiS72CykHfDKtHbgI/oe/4h4MG0D2wSGPmUTWFkO1K2uAwdLEYo+
	/6XV1M3kOZ9hAZdcEzOms86L38Sb10tm2tDsLete9xTSftD4xf8OoPDoVXZd8v400VEGMsJyyM5Cs
	Q+eyxt2dDxVY1UWNP7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBrDj-00HD4u-0i;
	Sat, 09 Dec 2023 06:53:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBrDf-00HD4U-2q
	for linux-snps-arc@lists.infradead.org;
	Sat, 09 Dec 2023 06:53:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so8367155e9.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 08 Dec 2023 22:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702104824; x=1702709624; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27fCHLUa4kUDvPQVbE+1w2YS5g7FkXV060e7T4s0mZE=;
        b=zjryF/TyYO7MQtPPxT13htr6uIaKeD+Xxh9Pcti9gWwLyArO4PhnV15RoMLsYMqhlG
         K/RaEgHYzLA7J8J2igYD8P+j2sN3jTSF3RK13bdtVyirsilgI3HIw1tmL3nE7e8Luedj
         08ifMRHUXFtVRDHdkTuPbJhD2aHNEXCMJSCPhx/L+UnmUiPtWijoCdWvOIpuqyKBZiEb
         pkJe2WT/Oz3Nv6r8kWxBLuA+E31TDNZUsLk9oXEe7DrN+JKNexN8gwT8OiW9MawKS6W+
         1IvKwsV9Foh5ARZqinPpsDXX+FZHkfuvDbtThYWnYxJnShRYZ5njTyBpQ+LZgJ7nPuXr
         ZDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702104824; x=1702709624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27fCHLUa4kUDvPQVbE+1w2YS5g7FkXV060e7T4s0mZE=;
        b=Lwq1mbiAK6FAvlIVEdgrxLVCdD3bhPF8usVbSz2JRE5Lf9A5f9nd7yWz5FEsBfWL5n
         EbWMXiBQ0YrlK1AeZAyoP9bHNyVyes/pvXlBssEGHU94N/xJLdry4G/QLkforWjqr6Xm
         uvo3mO94s+veNlQ6VL8Mi6Iua7Il6qnZtEmtqe6uxm0Vz95Ep6phSlplhN0+xEB9h3Sx
         0OLESiqHpmuIjCS0x7EN/hIESiLfuwEDZDa33+BrQO4j9uN3w3XRnnEKrsMchCnVzuSS
         g+DV4gslSw+SWGZ+ISkQ31Va7EbklQBRP/5SCw7mipFcZfsn1RzEZ8l+dEm+3I8ST4cM
         ZT1w==
X-Gm-Message-State: AOJu0Yz1vIoOtaL9g9zEwztAhDs2HqMbQs4e4x4lFFJez5b47V0tx+2e
	ppjZqdjeQGqEjNN6ptCnFXW+Rw==
X-Google-Smtp-Source: AGHT+IEIQ1SNS311RaYj5If/4xi5+/rSPck3nXd3hzicSBW8VuZz6UwTsNjF2kXqF810V0JsNEX7dQ==
X-Received: by 2002:a7b:c7d5:0:b0:40c:2bab:3d27 with SMTP id z21-20020a7bc7d5000000b0040c2bab3d27mr481651wmk.8.1702104823906;
        Fri, 08 Dec 2023 22:53:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b0040b2c195523sm7393926wmo.31.2023.12.08.22.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 22:53:43 -0800 (PST)
Date: Sat, 9 Dec 2023 09:53:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org
Subject: Re: arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error:
 uninitialized symbol 'release'.
Message-ID: <2fe769ff-a6f9-468e-9449-28731f8f966d@suswa.mountain>
References: <c2148229-bea9-40ef-bbf3-6019555f3f1a@suswa.mountain>
 <b78607e5-6965-4e7f-b43a-c1ca58eecf89@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b78607e5-6965-4e7f-b43a-c1ca58eecf89@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_225347_990114_1102C718 
X-CRM114-Status: GOOD (  11.33  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Dec 08, 2023 at 04:33:44PM -0800, Vineet Gupta wrote:
> On 11/27/23 22:22, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
> > commit: fad84e39f116035ae8d550c6020107b8ac113b45 ARC: boot log: eliminate struct cpuinfo_arc #4: boot log per ISA
> > config: arc-randconfig-r071-20231128 (https://download.01.org/0day-ci/archive/20231128/202311280906.VAIwEAfT-lkp@intel.com/config)
> > compiler: arceb-elf-gcc (GCC) 13.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20231128/202311280906.VAIwEAfT-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202311280906.VAIwEAfT-lkp@intel.com/
> >
> > New smatch warnings:
> > arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error: uninitialized symbol 'release'.
> 
> Thx, I've posted a fix.
> 
> > Old smatch warnings:
> > arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
> 
> This seems like a false warning. Its a register variable and thus can't
> possibly be initialized.

Yeah.  Sorry, I normally delete these but I somehow forgot this time.

regards,
dan carpenter


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
