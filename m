Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35927E743EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 Sep 2023 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Wo6hPwdkzB/3GoYFP17ToYhQzZunzrHbecp7NCa1eY=; b=f+6xCfGxdV5ger
	YY0O7CxhNqdYHGbAODyNSTKAeGofV0NE2AckZi529dvSciWDvhc81V1G1zDq4hSoC5632a0Rt9vBB
	KXsA3tayhWc/KKcSx0r82obhe71DO0zyvHWluQJCVEFmUOmxV+dM7R6OBihaY4fPdBPEQNDva35Yo
	9Htud1+dVvdbFd11j0XiCgWLUGwILpQUe05s6ONmi2jSinp4b93Qr6WDp/TjIFvtVwybMd63iS/n8
	VJVCq7NTTtyKVrEcQS11BMIZsiyWshfWsEzItCo+XYJHkWnQAkkk0kq+7vTv539IZJaZQKnKk5zvV
	gdQCytQi1i7nN6Kn/sbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm7fU-007Ija-11;
	Fri, 29 Sep 2023 07:12:08 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm7fR-007Iiv-05
	for linux-snps-arc@lists.infradead.org;
	Fri, 29 Sep 2023 07:12:06 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7ae0da3a692so2396389241.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 29 Sep 2023 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695971522; x=1696576322; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FmZRKIigA0ykCxEY+0N4Kzqi58uY5WB+JX2QZumaAss=;
        b=xbrBhTs26Un1/ICTuGDiYhwSzAhhD3tvfuFWjDfxxMGxImBW3L/0ev/NYZvdF6NJlA
         emAhyLXl75AKAp0LF02eushA974M3VFMW+a8Tt2urZx8HirAD0CXNuY8bZKH1Dj8mn8I
         PiHR3btjOvmtCYb9txs0FhiUlsPgCxBy8g25Jt23Cvu7W9T4+CTXeiM6+Wmk/EOAlWpF
         sxQ6mzEJx9FBPwAnAyQaG5gRyGyDuVfeV5IW1zMvavlnDCTOp8LZDIbA02pSn1ojHRXD
         a6w4OKAJGP32gSrsZv7qt1qwPnEPeThZG+LcFk+LTBLzFMvDAORNLu8mLfjx38+quZ4z
         hlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695971522; x=1696576322;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmZRKIigA0ykCxEY+0N4Kzqi58uY5WB+JX2QZumaAss=;
        b=B/jqI9lkdzdypbPEDLiQdxFIPpcw3q/kt4VtkagELsKWaj0Sd5vGkWwhYTBDYfg+pK
         E/pmpQecSWfNqgAM7ziScjnxPoBbfFZ4QfJd32vp1FgdHHLQnkToZOrt3fTJpQl4pKmz
         65l0nOqOD2tetS4fvDy+AHYlAoIx5AXAQOxscTkz1pYoOgJFBFMlCPBgEAVwfeBiMoDu
         +vgMxwoJN9BFcrCHYXkltpQzJOkOBaIO7VvtYbwzaGnIE56H1q2rdFIJlZYr8bKQge7t
         00IwGTuXymFVj1WmNOFH4gaILy4Ru0mydI4uIJUx+D/IQopYvqCmH85nBABvTAjcFx9c
         LMUg==
X-Gm-Message-State: AOJu0YzzW5B/uD0ucpWjZgsckxC0bp4DLXwzHs/naQZkGOhqigQhIvhW
	NqraQrhkXBpRfOySz1+4S5OSj0CgzimTeMiocUVgVA==
X-Google-Smtp-Source: AGHT+IG10QdAXHqWImprqOK2ab4qL9hNrpt7NoJ9tjYopqvquES3U0KG9GK4LYgWv/fxOAXFbhWSv2DwMh5uRl9UW2U=
X-Received: by 2002:a05:6102:d4:b0:452:94b8:2fe9 with SMTP id
 u20-20020a05610200d400b0045294b82fe9mr2543051vsp.21.1695971522079; Fri, 29
 Sep 2023 00:12:02 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 29 Sep 2023 12:41:51 +0530
Message-ID: <CA+G9fYu2DKDxOEFTeJhH-r_JD8gR1gS8e4YsSrW3rfGegHR4Sg@mail.gmail.com>
Subject: arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined
 reference to `crypto_has_aead'
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, 
	linux-snps-arc@lists.infradead.org
Cc: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_001205_091712_12107400 
X-CRM114-Status: UNSURE (   3.72  )
X-CRM114-Notice: Please train this message.
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

The arc defconfig builds failed on Linux next from Sept 22.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
-----------
arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined reference
to `crypto_has_aead'
arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined reference
to `crypto_has_aead'
make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:36: vmlinux] Error 1
make[3]: Target '__default' not remade because of errors.

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145384/suite/build/test/gcc-9-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145384/suite/build/test/gcc-9-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145384/suite/build/test/gcc-9-defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
