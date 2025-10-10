Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29095CCA476
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Oct 2025 04:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XDwnTIhoP3fWm7fFSxzbT0LeC/4sTkAUZ93V7y4xoo=; b=WRuHNkMbA05ZQN
	ptGgR8o2TdNWha652XiG42PrbUY+STUtp4HLA9JLPilAVscoSXAqqM/r3a0WiioSjGbb3rA8Z2GcN
	ogZ8kLwGEOfWG6xBxhJUICdmg/0Qb7GNlwwHlQAjaY18A9scfg2pBk6QfXnF4DLJKrTRZZxI4s8gc
	MebmngdgnNMoAGUlX32QHfJc4hxgkkBDl+SkgbXs4fuzqFfox9Z2UIgFOwL5T2CAhLS83qjVsxs8F
	qBq3yZS8BSgyE9nvxbw1kdoStZuPYp6PhQLuPjHO9FhqDZwHzTn2HM90A/i5QKJflPC7yPCt3KQze
	XBKisD+rvU7T97jllTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74Pw-00000007dPy-2R0z;
	Fri, 10 Oct 2025 04:07:44 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74Ps-00000007dNh-4BPl
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Oct 2025 04:07:43 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-723ad237d1eso15366327b3.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Oct 2025 21:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069260; x=1760674060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=Gg0zpDaQBr2D0XPqVXsPPKRLAEm13BuvnCSQYHsm8Hm2BCUw/idUy4NGOizF8t05i7
         tCwGEdYjG4Gmy25YlC7LGlgi08pC02Q22WD6emqwNK3FPKTD4vJfHu24qt7yvSh4jU2r
         8llQVkgWTzXI7PCMiqzv94sQlqCPv0aJEnt/NBX7yeQxya36/WxGH+j45CkJ2mHs1VxM
         1s219F+zGqml3zWkuRm0omMICOfP5/AR/90GOUdqWadAuSnbSpfU4msxRs4fGG6l93B6
         oLBhUggsg55gC6M0ZQ5Zp667LxBJ1nUAAm8fJYTEh4gpIbj9gYiSbIcjBMYW4JQLWdw6
         E5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069260; x=1760674060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=Xo3ZRohJa+HdUuL5lxrWVrkfwVjMqnA0R44VfHYeOGiquB7XgihPvK2QdJjoeT/eNb
         0kGgAoyggTYqWTyi/2HZOdU3aN6xn2+NMJ8oJBhbn794k1l3SZ+m1ZzWYj0PCjWD/OoH
         x5y3WFwn9RbVqENdTSroSWdCcVA5yHCd2jjq0BhP95vqncUcasoRvxVx2qWeDBz50o35
         t0/Q7j9HHvxLNMolUy7mwTEhnuvGkqMIl0neYQaiMIRv8kLW4DBnvWKdwxIyNqJBW6+P
         JRw/GizCS2BI0n4AmChl/w2Qgcj2ySSSAPdqc20pFx7k+9OIRlsqQGQe6CYY3zmvpktS
         lN7w==
X-Forwarded-Encrypted: i=1; AJvYcCWdHn2yaE9wwHRLVQ7PVw17hsi2qQBVIWc0nyJF+Jme7SRUaf9kMWVhjWjkZlsyxkrKpjH1qG23ZF8cOmenow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6N0WdbvDvVlF53ZZU/cci7ajxyR/DNv701aM0MGXOcK8omQZm
	poczy+nqs8MTK8Aq1HOC32iZOKnYP3jpjyxfKw6wADnvPUjSPCpE+VWXCi/CnXmz2QBaIq/9Wpb
	+A/TnnCvp4UPZ8cz8zF9MuYaxIQUYSdc=
X-Gm-Gg: ASbGncsizJAjbY/kH0E0XAEdHcGAb5UClj0JuTQLI4mUmrhrp00ftG9sRmswyeHHuIM
	VOTPIixYYHqRMv1rnQvEG3kkEgMRRszmAm/k9ycitmI2ORTjSFMnxTBr/Z6/1kyureLQAFTD/Xw
	40HVd99dli8dXGv0sSgijDZaPheXjVymh/ymIKCA5f+Z3mFkXMzEH7OM+GY5iuknBRTdlNFoido
	OotYeL1tokaoDpb0grglILeZQ==
X-Google-Smtp-Source: AGHT+IFQERg8mTh7nax6OaWavJ8DgllCOHm5p0zLQR54uFFNlwqM0wGCA+Q/Rj/bdvDMe/rRbnhyAA7hAcefbtq0UHo=
X-Received: by 2002:a53:ca49:0:b0:633:a883:3d1b with SMTP id
 956f58d0204a3-63ccb87491emr6995599d50.6.1760069259733; Thu, 09 Oct 2025
 21:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250916030903.GA3598798-robh@kernel.org>
In-Reply-To: <20250916030903.GA3598798-robh@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:07:02 +0300
X-Gm-Features: AS18NWBct1j-7S8OHD6pljCYd2aEZxR7vcCRPjZz3T1pRcQcUgdDoCBWxEfbyM8
Message-ID: <CAPnZJGAvQirGTJTiTxumn8sAJ5KYDv8+MUTBmEW2fYX+r2RE3Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Rob Herring <robh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_210741_041911_604F1BDC 
X-CRM114-Status: UNSURE (   7.29  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTYsIDIwMjUgYXQgNjowOeKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IFRoZXJlJ3Mgbm90IHJlYWxseSBhbnkgcG9pbnQgaW4gbGlzdGluZyBl
dmVyeSBhcmNoIGluIHRoZSBzdWJqZWN0LgoKT2ssIEkgd2lsbCBmaXggdGhpcy4KCgotLSAKQXNr
YXIgU2FmaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
