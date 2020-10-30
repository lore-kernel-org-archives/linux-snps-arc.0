Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3A0C4363A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 10:30:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0CD1221EB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 10:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s8U6OuT1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NR8L81S9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0CD1221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6lKguAdHG9osu8hyTaEvMc9Tht42n1mrrTN0k0ZL82c=; b=s8U6OuT16TZoSGfwU9THUMNITc
	CQvXcbcCiLEdDwoZnk2RlcdJHei77UVUmXJDDCWhjPtn7wT1nQ/ELIX1Cm2IEulnRh3y1GpJUmuMi
	ZZ7d77kUY2aqBx2v7QrBAqYwb0FmfjAXqJqBcs4mO++31gsZkbHzFaDJYTddWFzbVd/836+ltumlD
	mpeNg6pmoMcmdvCAC4DSj17NL3sIzVgBJxkHwiavpBcTy9hDNcp1nmonA8bXfw+eSVUvBKT/dJflJ
	08Yu1/nhTBNH/QzspyQin5vCi4dW7XGqwE9UECZ8js9i61AnyheOpOCIZGMH5COXkJr0nDbkIm7wX
	cJ/3HYWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYRfX-0006b8-3M; Fri, 30 Oct 2020 10:30:03 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYRfU-0006ZR-H9
 for linux-snps-arc@lists.infradead.org; Fri, 30 Oct 2020 10:30:01 +0000
Received: by mail-il1-x12f.google.com with SMTP id g7so6023908ilr.12
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Oct 2020 03:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9sx1pWoZJXcLY5Wm9TAUSmY3vOK4DUm68sL/ca16vuM=;
 b=NR8L81S9+Q2rXA+eNj78mO7XRQt/RQds0XcWiIlxQrVyNS5GfvcsC4N6yEaw/f8ASU
 s1m7i8Y+7SbD4J7dAmapYnZlltdUG/gVaPWBLa5DciSelzGlDb4qFKHJxhhksIajQ3P1
 OH23wga6hVxGgb6M9F79k86YLkAf7XIVFvrwyt9Kc8eK7/KC+hcZCMuGZzLBPO4jZG1m
 XzFwzagCmUmBPdx62fq2AGUwhruZGjTYo6sVz7mgGW+X9iJaETPm1vsTB0wnvj1mig2g
 MeJ0D+uWfjT8t9XQsPkACY7Mdbu3JT+qtdhKxL8YfQ48DWL0j6q07HPYCE9rNVhbYR9m
 1W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9sx1pWoZJXcLY5Wm9TAUSmY3vOK4DUm68sL/ca16vuM=;
 b=nhEMQX4FPsFuqYmXeMrIDlnLP0KD0Ej9YzqDOvBiEWfs7OkEYlXKkF3PcN3UooyJkZ
 MUZLc5RP1kUa1xLIcGulZSuqYI3qqG3F8+RBEOLqUvE78YL79n1IhD7xo0tZbedFhtqb
 3suNt7NrXOp3ZzIx4TiPTbU6s8sAaL2Jo9qHCQ4vz6RCPzc9fSR0vgdoSlTf0Zgx98lg
 m3MPf2Ri//PXpzDP/quw1j1LLWdGXQ99cJroVNW4LJca2IUsQ4qGmO3x4bAKa1YX+EnU
 9hcaDusIzFY5YC+cUkqoLxIizUabEeKHOLTqbW+2opAbx8g2oluezb8bO4uviG+j7fTO
 L2iw==
X-Gm-Message-State: AOAM531ZotqRoOZX5lRthlehdqlkgxszfFGzG4Resh8ARuRE543+kyZ+
 f+Gffw/3kxqIoJPN71lNMTO1wKBOP94wB0d9Z/ViUQ==
X-Google-Smtp-Source: ABdhPJwKPzdHqKZmTe0eTTdzPBkY2P1Ps01r+uZ6c9N+iLdEzFKoIHdfBMck7ydrFn1gCt7CIdg8r7pdE9inLUPmDxw=
X-Received: by 2002:a92:9ed1:: with SMTP id s78mr1294883ilk.71.1604053796854; 
 Fri, 30 Oct 2020 03:29:56 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 30 Oct 2020 15:59:45 +0530
Message-ID: <CA+G9fYth+F1TnG6GQNKtrxvChvX9m+nGa8LKFG18WCzsqNJg5w@mail.gmail.com>
Subject: arc: kernel/entry.S:310: Error: inappropriate arguments for opcode
 'and'
To: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 linux-snps-arc@lists.infradead.org, lkft-triage@lists.linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_063000_580950_AF6BD316 
X-CRM114-Status: UNSURE (   4.73  )
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
Cc: Vineet Gupta <vgupta@synopsys.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Christian Brauner <christian@brauner.io>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

arc defconfig build failed on linux next 20201030 with gcc-8 and gcc-9.

make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=arc
CROSS_COMPILE=arc-elf32- HOSTCC=gcc CC="sccache arc-elf32-gcc" O=build
uImage
#
../arch/arc/kernel/entry.S: Assembler messages:
../arch/arc/kernel/entry.S:310: Error: inappropriate arguments for opcode 'and'
make[3]: *** [../scripts/Makefile.build:364:
arch/arc/kernel/entry-arcv2.o] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

-- 
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
