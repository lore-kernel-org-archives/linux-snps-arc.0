Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671ACC25B0C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 Aug 2022 15:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDnvhtwIVR8i2TEyzG4b5TlrEq+Gdldt/3lWeCKuhYU=; b=jXAm2XO9O14zZe
	+c6pzQBnwZIYqOlEVCDmOTmxXUaj5Paby5bmTMECTYKS6zcM1wMiWBHiyWY5Nop89ZI6LydLUhdT4
	zSeyA94DxffyqSM2FJv61t2P0g3BHYsuhwSjlbGtKFBN7QTFIfHn/nZF/qF2e0nSzGOjybYYperOI
	MoMCtZ+SmchLjwLZr/IAPycu9OyM8mLJw6JY9+Q5uQHVGIO+ZwWiRjHoHg0pXPDLLUorB5Fp7kSu/
	/ILc7jxh87a5nikjdkYJHq3noA8s93p6EkSi3Ds7siDH2j4aNVUS3wONRo5DPQ1MYcfsFi2pu1E7g
	2n03v8hwwSt7kgFYGZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMA83-00DwhH-Kp; Thu, 11 Aug 2022 15:29:47 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMA80-00Dwc0-0l
	for linux-snps-arc@lists.infradead.org; Thu, 11 Aug 2022 15:29:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id 17so7855319pli.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 Aug 2022 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=k4cTJcWzw8+6axf00iGx7biHKXUEGT3Ofca07ePg5B0=;
        b=e8WRD+IbMXLxt0XX5XAhvJBvN5jLNJ8ZUx93+YW8cz7r7GCpyryYTdJ+UJNUPY223r
         zzoPmw6xUn3VMbJuI2F2ZSeOhIbrKmiX3G9mhH6iyovCbNm2Puhe2oTBwUlY5OL7qfj2
         sQGEp1yOeNmSmYqyuuyL7LSmz37k/frFxM+oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=k4cTJcWzw8+6axf00iGx7biHKXUEGT3Ofca07ePg5B0=;
        b=wuuFi3WM/IYZ9cmwY5GaGbFv67HzLcl3M+FJol+TCWwXHFSINHq8LfKi17M3H9kgON
         6nVTQVnCzLMdP9E0NSmvkDIOTaB4BlASJ7u/FMhzql+qmy1G/VPHLgp5VvL+trGRMJcg
         lmHtYSldEIjejkC7ciCGYYO0/bJ0TXVP8xjEXYiBepbBl2HFXIaU0xNznDUZKUD782cd
         YuD6HTtMPLEPejTkRlfkiZCvwUMYajrxtyHLSQu9lj/bE2i/ROJXro3Ibwb1rGiLYY0j
         n58J42LjNxfsmWmDipMfT9Zi5Vl9HObGHpL8hUcf7ZDG4ojCSEKPEbYSPI++uiZDwcuV
         GOgQ==
X-Gm-Message-State: ACgBeo0fmMPqSChFFkuZQfE9XIPgdOwS1ydRUSUvzLATs1CWGNnpN1dY
	SoCJtnWruCcE3NEl9zVnkOHT+g==
X-Google-Smtp-Source: AA6agR5MDAoWj07mo8Re6bJHCK/lTI2S9VYB/kjpRf71aZeSVUXPPLyCezVqfrd1Gs3g5Ty8PSMb+A==
X-Received: by 2002:a17:90a:55:b0:1f7:4513:8cac with SMTP id 21-20020a17090a005500b001f745138cacmr9192293pjb.93.1660231781372;
        Thu, 11 Aug 2022 08:29:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709026f0900b0016f1204cde8sm1985339plk.301.2022.08.11.08.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 08:29:40 -0700 (PDT)
Date: Thu, 11 Aug 2022 08:29:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Richard Henderson <rth@twiddle.net>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH] treewide: defconfig: address renamed CONFIG_DEBUG_INFO=y
Message-ID: <202208110829.F82D003490@keescook>
References: <20220811114609.2097335-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220811114609.2097335-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_082944_071271_B3DEFFF5 
X-CRM114-Status: GOOD (  13.40  )
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

On Thu, Aug 11, 2022 at 01:44:34PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> CONFIG_DEBUG_INFO is now implicitly selected if one picks one of the
> explicit options that could be DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT,
> DEBUG_INFO_DWARF4, DEBUG_INFO_DWARF5.
> 
> This was actually not what I had in mind when I suggested making
> it a 'choice' statement, but it's too late to change again now,
> and the Kconfig logic is more sensible in the new form.
> 
> Change any defconfig file that had CONFIG_DEBUG_INFO enabled
> but did not pick DWARF4 or DWARF5 explicitly to now pick the toolchain
> default.
> 
> Fixes: f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO selectable from a choice")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
