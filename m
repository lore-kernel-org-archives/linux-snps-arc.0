Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A42CCD185
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Oct 2025 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7GVziP0gnkgNdOHdrx0AIaAQjAWF03jfNfaqa0E2F4=; b=JsjOr5z97Q3SOJ
	5IZBB7Ed0zyZ8bht9y2FRV2BMC6vvi4x/H/ibnRSDupZ/5HJqTOCNB7tbVR3kIfoSHs9pyU2uX0RN
	gK07Z22aWlorzDtUgkpgeHJCcc2r024hvRdzGHEyPy3J9OpTGHARNhaIr7jkngCEbFObLCIfWj/gm
	23LW7FQaoNOeYXoc15XM0YYmVQqBdmDb3bXp7A5ToPWFo4bKV+AmBOWOTp0MAOGedfZG/kQS0yhYY
	rtkR7D05w+y7/YnitMlVicQ7KSOC4nmy+jHai6cjay4/xCXlLRiwduSqv9u4/8e3oMD5Sf73mSArI
	GYb7ZFsI49i7n726/piw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ogQ-00000005wdB-4Ax5;
	Thu, 09 Oct 2025 11:19:43 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ogO-00000005wae-3CjV
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Oct 2025 11:19:41 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-72ce9790ab3so8427547b3.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Oct 2025 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760008779; x=1760613579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=LlMl+VGPFUjNmiyZL4Il+6N5kU7lsur5gQtbN8QvDuQMK+V7fzrQQfoaD5xEjaMJC1
         oRWNhcgaVE6Own2LyrIix2iPL4B1HPMwnUS2Izv8c6n9owxYeh7JfJDB+XW+9Jh8lbnJ
         Ubac8g7epzggu2yx0yM6v+SCTP0NRs0dADSz97JOooRtfEdj2tR4+JUT5DA8LasX7sNv
         Jc3u/ZoWvpBwkMoQBh6EJldxOlntoWQHyEm0N4Rfy3B+X0Aquz1IxjTSwZJritH/EVM8
         u33jkP4R/T8jHLXgROxZ8pTakX32qlPW0g44jKnCOTeCFkNFR65L4/b8FESYfbQ7Pqt/
         BIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008779; x=1760613579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=BCK/McXvWnV+ugjfcidsGWAuANzg01rw8R43c8WKOeYjqN2RCtziusa89uMLQP4nvw
         RzUCOxuu4EB1iYQ6qALGyHHOCEuUuau2nsYCr7CVfrCQq9qk5uoaGGuJK7hWn9xilUAg
         MYLIYMGLmfm6RAz1j53J6Oaz1axAWEDePPc9WHj+MJONx1T/+pPKr8M57u8EbJ+gWqsY
         YkotoC3Ktkq422Vqq0GEjhNx2AkA75RpTJFhzIW2H2Gk4q1xYffsLMDD2LTDYB16ulyY
         kuQf2sdKb93mn7LQfMEXl1Y1WHrDfZIR970mM9BBLzzC0aK/9+5uEGwWmWSABM90pDwC
         x/ww==
X-Forwarded-Encrypted: i=1; AJvYcCUCGxfxeo2y1lZ5AD1YHSSMjgme4KmGXYDyV4B8t/Ou1ZTT53//CyJ5UX3m/V93aFR6EwZ0RMvNRscx2vNh6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzC08htg/JaLKKVRlvm8Om3O3u5RjM7WNdEL3MNsXbXLlj/OV47
	a0aKED4BHaF+B4yDIKo1QH4qUyYJxKaHALtrYxZ3rWlor8R/mT7kia0BN+4JYaqAcgzYvEIjj8i
	eTeCcJ4BFz4aMMQZpQLAyC3BQY+U8wZk=
X-Gm-Gg: ASbGncvnj1XWo6+wXTZa4yzwICsjU9k57USBA3WBwVfRtQTU8hDzlAaJ36/HYCqPdUy
	Ablk/kythODfg3TjfTdqaZ3O51sZ93HzXbh8VPAmKnnNFMDU0QDk7gUW/fMYgHohabyX7s3PRXO
	PYSUHS0QsrcHXdJ9p5r/RqSCqBKMyxvo8IfxCZvgyU1rsXFyl1bGBamGdTRI/m9/Lm2KJYLukI5
	ZjKMbZXM3zi9Svnzyv5sIHp4AbKtnE=
X-Google-Smtp-Source: AGHT+IE5U7JyGi1AmeLjDi25hUOta+sU2hpJbVTN9Ai63ARDyOdLqRjdCN3h5Wr4u+tqZlHZJ+/pg/7Xr5jCWFq4BIc=
X-Received: by 2002:a53:d048:0:10b0:63b:8e80:c017 with SMTP id
 956f58d0204a3-63ccb672a0emr6807745d50.0.1760008779377; Thu, 09 Oct 2025
 04:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local> <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
In-Reply-To: <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 9 Oct 2025 14:19:03 +0300
X-Gm-Features: AS18NWAGN6ExXhEWeXK-ERFvGpf6JdjWShiWpIPYOnPjMCR9bXVHwIY8E_1WxIc
Message-ID: <CAPnZJGBwFqNAybORpTtRfjtGwMQiBtd+rATD=mh8ZgE3owT_ow@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Borislav Petkov <bp@alien8.de>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20251009_041940_808046_DF7D72DC 
X-CRM114-Status: UNSURE (   7.79  )
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

T24gU2F0LCBTZXAgMTMsIDIwMjUgYXQgOTowMOKAr0FNIEJvcmlzbGF2IFBldGtvdiA8YnBAYWxp
ZW44LmRlPiB3cm90ZToKPiBPb2gsIG5vdyBJIHNlZSBpdCAtIHlvdSBoYXZlIHZpcnR1YWwgYW5k
IHBoeXNpY2FsIGluaXRyYW1mcyBhZGRyZXNzIHRoaW5ncy4gV2UKPiB1c3VhbGx5IGNhbGwgdGhv
c2UgInZhIiBhbmQgInBhIi4gU28KPgo+IGluaXRyYW1mc197dmEscGF9X3tzdGFydCxlbmR9CgpP
a2F5LCBJIHdpbGwgY2FsbCBleHRlcm5hbF9pbml0cmFtZnNfe3ZhLHBhfV97c3RhcnQsZW5kfQoo
YWZ0ZXIgSSB3aWxsIHJlbW92ZSBpbml0cmQsIHdoaWNoIHdpbGwgaGFwcGVuIGFmdGVyIGEgeWVh
cikKCiJleHRlcm5hbCIgbWVhbnMgImJvb3Rsb2FkZXItc3VwcGxpZWQiIGFzIG9wcG9zZWQgdG8g
YnVpbHRpbiBpbml0cmFtZnMuCgotLSAKQXNrYXIgU2FmaW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
