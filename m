Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B33CAC592
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Sep 2025 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzWw7IGDhKr429RHENu6xBCsrHquTgKDXzuob9QWWeo=; b=WbXXWManuERoJC
	PBpQ+oPm78QBscK2AO96f8+rHndkOqWxV6ZGca5m9fn+n1VjvTjeTne3O0L0RTyfJusxZg04CWezp
	z/kB2MkbEGp/1vLndOr22SSjGV39Vooutzmc+f1g33uwQAisGL8O6X2iUof27FM3zFTI1C0OTZFhI
	tIlKE39gnheWdbnkv5WDO7QvoX1YlireEWPl0u7W5B5JdNV+9LXo1oNkg/+q7Bn29HA0C/K0xdFWQ
	kWlvj5rl3UxqGsZpPqzRCRygR3Mp8BlDEDcNWbQSpU1SsKyF+WVfwDmqL6O36AvaljoHq3Bwzkpsh
	XNHASIWHpkeLVdEox9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZAS-00000008aBU-0OEp;
	Tue, 16 Sep 2025 17:08:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZAP-00000008a99-0ssY
	for linux-snps-arc@lists.infradead.org;
	Tue, 16 Sep 2025 17:08:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3e2fdddd01dso1580862f8f.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 16 Sep 2025 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1758042511; x=1758647311; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIXyc3Fa0oN4a5i/p3ClDZo8xo9GAZJtSKI5SCU0zd8=;
        b=JZDCUwzNIL5tc0KzzKC1h1hvyA/NrAP4qNhVIzbEsRl7J2TWLRup1j9uKpwYo/Gb/Y
         gPfqnxXjaxkH3rjEMvwLggfLTtAjtm9A9jQMBMLiYb3SFRdTk0QSVR9iGP1fipvQK3k0
         MPlW8nhSMqgW2BeYOobP3qTBEBVMaT0nFyLd3G5nmBmiiq2WLggL0vCw1TVkQq3cqKcb
         51lcSs/0uLPTLk+f4lebTnJzjLL1MQK2XUnyzPEPoxmtv384ohaGR8lSmyOiljMN0az1
         NdfzzYFYUoHTnSpK2hYX7CpnF/N3w1dipkcq6ybvYGdMuQmBMFMbnwDi/wByUvcKf0Zw
         Sw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758042511; x=1758647311;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIXyc3Fa0oN4a5i/p3ClDZo8xo9GAZJtSKI5SCU0zd8=;
        b=BnSNYlQYX0hQ8d9jIqo3EvP0s8ghCmP4Ffg+GQbef4CRi8/9HVh8l0UC8dcJBxXn5b
         g+qOq1TVAcVlrVgHRuCQL5MR8TMbWrHwWWqRRmIXzci2E+Ww85tnmlGnFNeSPpTR82yJ
         56fM1xrvjjTp9XGEaMTNCwBAt1RlgyReiIJtW1RbfaCt7sbgTu1d8aXZ8xPcXalHYhUO
         nVM62Ku7NsPfWsKDMAVTcDaztaBDNIlW7LaeN6dOT2wCIlkyTFKbquqaTZd8QezhYy0Q
         wUh/+qdiAZNS5jwMrQFfdQoilBoHfjBUBsITkOTupJAK6fpZudqR9IFT24Yx7TlofgGW
         lWjg==
X-Forwarded-Encrypted: i=1; AJvYcCUKwKM2aDO7YPOsaCUhBhzhTSy5Jk0K/AlERk/YHdEM2hwOIe7wRUKlTtlWeHbe3tHKoCiiXvESJFR3XnbXaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7loJey80CJXB4UlaRfgXqE1u2GAxhdinBsR/iVhTOvnMtR/jH
	Jef526ubK83Xek3bEAOXC3apiaTmJuk6xKSsG7fiyUO1HOdOky3zOKl19RtpO6639bY=
X-Gm-Gg: ASbGncsW3YGBaaph5x1nRRQoduCnCBKWQJUrHqHzmKa9SRK+oVHIxqZ2u/2JVcsam44
	E3U+aX+F3Q1SsAG+EZGlZG7rwmZzg8ehLcLPuRO6evrLGa8WAdF8oRJ7+ofKutkGavCIIMFgix0
	Kxo/mJWEmiuIlmw+NYw6pl6lrIjokCNe4mUgmxBPGQRFLc0JHCpfPp1I61KvCRHInVb9yK1TnxP
	ieN2cX3TtR10f4hv7VctaMgzoVXcfqploXQZBLHCG09KjgXC4RLlz87GNPh2m82XCIuv23bvmGN
	0xWCi9DRgXiic7Ew0fO7U/3xv9bNZ0QQfAO2jioc4m8BACtbRRNw+vhOmmSeaLItVw356ctvEoZ
	wntUfzb2taODG89AzGCPgzRNvs4kNFlxUCTk2AZv+TLT2MKkQt5/kE5QWTQ==
X-Google-Smtp-Source: AGHT+IGdFovreVsG0VTuKKVTgWJJEqEKFnO21Mo+tI9uoQq7jJrFi/9vVCfXuUmfB6QhCbWUaAaAkg==
X-Received: by 2002:a05:6000:2dca:b0:3eb:2437:97c5 with SMTP id ffacd0b85a97d-3eb24379a13mr7083124f8f.22.1758042510664;
        Tue, 16 Sep 2025 10:08:30 -0700 (PDT)
Received: from smtpclient.apple (nat-184-7.net.cam.ac.uk. [131.111.184.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd0a7sm22520843f8f.39.2025.09.16.10.08.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Sep 2025 10:08:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
Date: Tue, 16 Sep 2025 18:08:18 +0100
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>,
 Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aleksa Sarai <cyphar@cyphar.com>,
 =?utf-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Gao Xiang <hsiangkao@linux.alibaba.com>,
 Art Nikpal <email2tema@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Eric Curtin <ecurtin@redhat.com>,
 Alexander Graf <graf@amazon.com>,
 Rob Landley <rob@landley.net>,
 Lennart Poettering <mzxreary@0pointer.de>,
 linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org,
 x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 linux-block@vger.kernel.org,
 initramfs@vger.kernel.org,
 linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-acpi@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>,
 devicetree@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Heiko Carstens <hca@linux.ibm.com>,
 patches@lists.linux.dev
Message-Id: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
To: Askar Safin <safinaskar@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_100833_283394_5A308AD8 
X-CRM114-Status: GOOD (  10.89  )
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

On 13 Sep 2025, at 01:37, Askar Safin <safinaskar@gmail.com> wrote:
> [...]
> For example, I renamed the following global variables:
> 
> __initramfs_start
> __initramfs_size
> [...]
> 
> to:
> 
> __builtin_initramfs_start
> __builtin_initramfs_size

I strongly suggest picking different names given __builtin_foo is the
naming scheme used for GNU C builtins/intrinsics. I leave you and
others to bikeshed that one.

Jessica


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
