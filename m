Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEE3CAC5BB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Oct 2025 04:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6N87pqrMkiE1ZIyheRezMGp1VGw+G+Yso8SWgbe6jo=; b=28vDYXLmGk6I4s
	Rx0BROkavxg5Auojr+Uiq14jZvfVjVE2VnprtajKXa2CDXzkh/PMJEywWAjUNkC7vPJjt3tY0PDVD
	kKyYOsx0W53SA/7rs28662OUE2QY0xb8Iq8WjXAUN6Ia+lOw8zegPEqK1t1ksWIswa+DzGC/wo1IH
	8yFuauVEHA6UxSIypBRKQqjSKybX9z8TShGgnZvUxfZ39LHvOx0LULbEwcMVmcrbZA5ZvrhRR6M7F
	6T3x2sLB/NPtvqEMT/hOCP638BiB+TqwNy1aIJlgRwaR/p+kvBw84iis2BvbBpUBHh3bDXZrR4OEu
	yY1/opjLD2rNxLukX/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74Rr-00000007dky-16Xm;
	Fri, 10 Oct 2025 04:09:43 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74Ro-00000007din-0PGf
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Oct 2025 04:09:42 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-635355713d9so1612552d50.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Oct 2025 21:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069379; x=1760674179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=PGMEb5C0TDzFP/RAVyzqFdeH5N2/zr9r2MEf6PHAbkm6wok3cB1LyYrx25qG02P1cm
         0CvYRKZkwsV/LTbLWORgPkXGl1nv3k7h7qcUXXbVOqKk8C43ab+wyFcJpfH4Q20qEUi8
         RdQrEU8B2XGEdBo+0qE0U0fPpasNKhslJ4nhVaWTIq7P5whH+jtQg+vKHvQP1GQJ9T/Y
         gk4zbpPGTqbCj2hit5n7gbm3XeTrG5lqu7Jn/F0IHg3SWw41TdmE7OdnOEp/CteoriS+
         af0UZ3ax40ew4TgUC3DQqSTYEzMPBGEcw0sC/25WiO3WYsQmMmvGV/x7SZvMlTZenaIh
         aYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069379; x=1760674179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=XJOJGyVzPcerwAJnRLrnkMrP842MMeLo6WUehVSsdVbZwAipOfjAsQyQEOwRezQSUZ
         oooGmZ9jOxGxPAIHpd3aC2hcMKVpifpi3QxJzKcWSkao3itXnOVo2N1g164jvMgkGdBP
         02kYotUMkzeEnVq7hpyyHAlsJFRPX6kl5R22XwAK5CvW4y8GRZjz1VIAJAhWFO3jchg4
         fwlahRkRZcuDv+H1/SLAXeB87c5hmjLGb09WzGe2IAVuJrTHukkKM417+MSbTd0H4BRq
         1GQEC2Azp6vyAO0+5aL1uqvUB40fZCPEKEHY+EKS5EMxjt5IrTSTH96AvS2QHUMYxKCw
         +2IA==
X-Forwarded-Encrypted: i=1; AJvYcCUVJLKW0HzgjnEmz0zwbsM42v+JOC4DV6ThXsa1jSPibhuvIkNoXiZLX+MLhQ26rw0ddxFlphrM0qXOKZuMeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAA9+9mNMTAJdiFuFq+7fJfFdkMbTxOhwy/+Y9FFdBPjH10oSL
	YULDzq1mM/LnVYPFNiGtZlT3ImmDdmK5QJEdJofAbwQhO7PubR5xeBO5xYZ+yQ7ceWSV0lhCrzV
	R9JSMZpkRrBQpsu7PAUzjMqZdxB63fe4=
X-Gm-Gg: ASbGncvo9+p3vHlVMAfzwQ2P7cuAq25KE92BCB5s+6B7yaW8Y+233r8GI3DdmKuPv94
	RaIjG0/d9szkylGSfOAMozk0d3MDMa5thpq9kIswau6nz9LaxjCrH2Cthbbx4t9HKIVGrjMbQTS
	QjpBEDRrCIep6uMnoZvAHT6S9fFQqancHMD11AM7en1QJEWmjLVh1WUzTFeY3UgB+pJ/emk1lSt
	l5lTLklX1gqa9eOkxUwR9Kp8Nj7VorIB6An
X-Google-Smtp-Source: AGHT+IEKzDZJ3mg1FFWOqowFJqWLj/+dmJPdM199pmmtVcavFH/YLuoH0hEdsvn7dHSOiTNw/3Aomiv0DcOjJivXzrY=
X-Received: by 2002:a53:e946:0:b0:636:17d6:a30 with SMTP id
 956f58d0204a3-63ccb82410bmr7618496d50.15.1760069378763; Thu, 09 Oct 2025
 21:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
In-Reply-To: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:09:02 +0300
X-Gm-Features: AS18NWDxe32nrD4BfQQFhIe3tEEfxrwgJsYQo_BWhSUPsy5CceSv7QOcZ20roI0
Message-ID: <CAPnZJGAKmgySY_RK0kmGTgwUh9hw4FSrVR+LoJCbD_RmJZe6RA@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Jessica Clarke <jrtc27@jrtc27.com>
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
X-CRM114-CacheID: sfid-20251009_210940_167181_81F7A7FF 
X-CRM114-Status: UNSURE (   8.27  )
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

T24gVHVlLCBTZXAgMTYsIDIwMjUgYXQgODowOOKAr1BNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdA
anJ0YzI3LmNvbT4gd3JvdGU6Cj4gSSBzdHJvbmdseSBzdWdnZXN0IHBpY2tpbmcgZGlmZmVyZW50
IG5hbWVzIGdpdmVuIF9fYnVpbHRpbl9mb28gaXMgdGhlCj4gbmFtaW5nIHNjaGVtZSB1c2VkIGZv
ciBHTlUgQyBidWlsdGlucy9pbnRyaW5zaWNzLiBJIGxlYXZlIHlvdSBhbmQKPiBvdGhlcnMgdG8g
YmlrZXNoZWQgdGhhdCBvbmUuCgpUaGFuayB5b3UhIEkgd2lsbCBmaXggdGhpcy4KCi0tIApBc2th
ciBTYWZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
