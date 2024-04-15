Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC63C4345F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Apr 2024 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kHQers4puWoVTGh2G7wK4SZMcls5aE7eTRILUA+v8Ms=; b=pjAMKBIEIQWyjz
	pMs93ZMs/DOt4hYBDc5jXrEgeUIP2yojIatp8srJ1BeCXsQe2SrswmLboJDEbz4XaFIBxZLu4X2o1
	2brAy+UE5sgRNwH6OvN6bHcPxeKV0L5puYZy4tuVzGJ8R428gc4OqnnJtuamMzu3DNDcUkAyTAszY
	UBupV/UJCTQ/Ck3tAYaU/PTOsg0xfPCHN9J6fqltNFcw8BP9JTKsfdQQZktf+qDniaZ3t5Z+Wa/hH
	aTpCpTXcJ5dbojKsY+0zvjD8HmEdW0bvOMt7iWVQOnGAXqiy7zyGTmiUO0rrQpcSprMl7C2lU0pI9
	iLrd2doD+wDm5M5QLkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJru-00000007uyq-2cMf;
	Mon, 15 Apr 2024 10:47:22 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJrr-00000007uxi-3ERi
	for linux-snps-arc@lists.infradead.org;
	Mon, 15 Apr 2024 10:47:21 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7e3e0b2f653so867033241.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 15 Apr 2024 03:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713178033; x=1713782833; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5kbitX8QbhgxnsV5uCd0z4f/iShjUxkr6d7+ekg5tWU=;
        b=b5xP8w5KZHP0Yly7lXdloDotGshV809niFjPRiEK5DZIw9mHXKZoUMCAZlKafcmV9O
         Hhhvm5LIUz1GjmyhhlIe1/KXw0qYWwaoabnd9VGwx1srBWoSWy/GqFSiP3S0ESecPcih
         21GryoTfBPPB51apyxC+9AxlcmV3FAhEOMnXkttvFRXpddzufoDTZ3BkEqSbSLOo4tk8
         +qlPMaHBDbdLQzAxkW0E8RbxUQwkt6AoIfDImxvPF0mlwFTQVfZtl/WQV7Haf70X/4KY
         xpOZ78qvuL9nVoOoFmbnF8KDuKFhWiPvR7ASzhOqV1qvPAT5dZ9zGY2aXgCcPGbTBnUR
         /sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713178033; x=1713782833;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5kbitX8QbhgxnsV5uCd0z4f/iShjUxkr6d7+ekg5tWU=;
        b=J8rIeUS8rBCN8gtSAZa77Xzv+8Hj2K3CrXVaXC+rpnY4FrWuMvyR8jyFeYPs0i4OHV
         tgAFGHetOqj69JFzIKkCfqTCwjgJQmgtZ4a/jt7ISin5HCMznWKkK9gH1efdiqilRDWF
         rw/2hbULDUtf2S/rGSVXkr0L+sYv+Iqs+0/TvOeyfww9/aFH/Zp0jw8LkFWAOqMJ/COG
         E9zEedvvjDSbUHQ7nzZESA3wermrGtFdCJI9qy5rBjiFFA+hHFJ4rg2IMEAxsSr+jsaJ
         tCRXdMhn4QGwGQoNATGR6eT/dCBqlY5+tEUIBwTFZZhdIzi3QOejVq1v+yRe9fEoWV18
         e1qg==
X-Forwarded-Encrypted: i=1; AJvYcCVvltJk54uGYAj1+/YPoddsZDzI5yWGJRGtpIjiUJuf5bwspfZ9iYDflQROKBwqemWTZo4DZ3WX+Nb8YRvt99Xl5n0+HQ54zXOplZIAxAVKShJ5
X-Gm-Message-State: AOJu0YyZTsrul2BxmFK4UFsqiO413e3Gt71IidYxmjJacxB018uySvtF
	K1mgTroleqmvNkdteUYGh6jq7QZzvNYmyVEYeNFPU3dqaADvzA5qksJcEAsCwpXCfyvWbhcUCWt
	l4Vf8Xo4n+bpYfK4zCUDQUlRzbw/tmeJ31EweFW94mOX7ttp9WN0=
X-Google-Smtp-Source: AGHT+IE4veDIOcK0vTkuxFAc8PebEblKLgDeLZg7etQEi0PYMGKyP1c0eS0dCvLk7/PMRnxeklqAIbshIYBCJ0ceNwA=
X-Received: by 2002:a05:6102:3590:b0:47b:8ef7:bc1e with SMTP id
 h16-20020a056102359000b0047b8ef7bc1emr175678vsu.15.1713178032756; Mon, 15 Apr
 2024 03:47:12 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 15 Apr 2024 16:17:01 +0530
Message-ID: <CA+G9fYvMdqT3BFNkspktVVtVqd=en8-x3Oz1Ekfia+cceV2LHQ@mail.gmail.com>
Subject: sh: arc: cmpxchg.h:50:12: error: implicit declaration of function
 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, linux-snps-arc@lists.infradead.org, 
	Vineet Gupta <vgupta@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_034719_838914_82D0BE79 
X-CRM114-Status: UNSURE (   4.48  )
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

The arc and sh defconfig builds failed due to following build warnings / errors
on the Linux next-20240415 with gcc-9 and gcc-11.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Following builds failed.
sh:
arc:
 - defconfig
 - tinyconfig
 - allnoconfig
 - vdk_hs38_smp_defconfig

Build log:
--------
In file included from arch/arc/include/asm/atomic.h:13,
                 from include/linux/atomic.h:7,
                 from include/asm-generic/bitops/lock.h:5,
                 from arch/arc/include/asm/bitops.h:188,
                 from include/linux/bitops.h:70,
                 from include/linux/log2.h:12,
                 from kernel/bounds.c:13:
include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of
function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
   50 |   _prev_ = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_); \
      |            ^~~~~~~~~~~~~~

Steps to reproduce:
---
# tuxmake --runtime podman --target-arch arc --toolchain gcc-9
--kconfig defconfig
# tuxmake --runtime podman --target-arch sh --toolchain gcc-11
--kconfig defconfig


Links:
---
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240415/testrun/23463978/suite/build/test/gcc-9-defconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2f7sIl2MlKB5Fgq7JtTpYQ9lnXw/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240415/testrun/23463981/suite/build/test/gcc-11-defconfig/details/


--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
