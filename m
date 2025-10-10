Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CB8CCD183
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Oct 2025 02:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrrXZIhDChwBQ6Jmk8+/ojtRN6aZTFjGzkj3BhbLxmc=; b=HqRoO3qGB3IUUi
	hnyxrol9m/ZSbvLOfVEtPw7aySrgDL54L4T9gO+HV0Ff9xQcPnHUFPLfiNm3oyXj2G/UqJhjUHrnH
	DBhDks0qP3hZNxMtK8C65z6HfgxcXx2sQvU7OKwgNbURrRS8D5l4sb8vc6PhHCcUnBKnPW0umjUmC
	pjG74GITHpfYdIUllrMELo30r/Knk0nfftKeo202iPk8Ga7+TSJeuB64+PEIrMJaLLRTkkaLc+dnb
	77puxmm1g4gAz2VUfpr/mmKMy4jkTiK6RzUMTdQwNrU/N0gw0KrvIl9jUxiXSjMIbj6t3rv8QnVjX
	JcthMpcIPuWB2FyGUy5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73BX-00000007WYa-0jgA;
	Fri, 10 Oct 2025 02:48:47 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73BT-00000007WWp-3A6u
	for linux-snps-arc@lists.infradead.org;
	Fri, 10 Oct 2025 02:48:45 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-780fe73e339so12142017b3.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Oct 2025 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760064523; x=1760669323; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=nn70f5QF3gnIFo96OLfM9AXsi306gRPjkR5MQ1WgRwMxQhlGQ4uTK0OMQgXQ5NuF1T
         TEKTfv56Ew9qDwVKro9r4NzdlRy4umYWPKZb6iUpmajuxe3CfDE5xqPxL0PkBbDroIOh
         i1gucFxOywYyh65NprHvcEXRXUqZjy9c10CjXMgYm4wLMOND7Hy9xB4fmke6C253Qbxv
         DORAI+SzQ4kT2yBLhUKff8wA+AvB4xaVfiWb9Tz3EA1Cn0R8ov4Cfd6f2GHEYiu9X7zQ
         +ocsJ7vcJQcXW82XrbnEHuWF5jU3tgQgH5MfUMqeb//eWalvzdN4eaCmkJzfOtHPEXdl
         QeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064523; x=1760669323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=NeAvdOESYYIgjLESkAYM2t5Jk0sSYeDBtTxtKJT0ACQ4CSWofJP/3K1QYI0Fwrhbl2
         jf715rqD3/hHBVZVZY9ycHgmZfUubXLFP7XT+ZvasZvaunnp3oKcfn3bVwaG687O6VSt
         /kswimHjdZW6xq6RSTRj/l/gsNCd8ZlaPZ0gZv4VxBE0qUER69TtkfJviS6s+d5mMxtP
         44qEPQzT61IyTkOQ4DAllwZVXopTWu2wb6F5bVMepGL2NZz6IwMX3JtjnaizC0oOIP8H
         8qtRRs2n1sr6eEfhweSyGn0Mr5Zc92e/WluRDONg4YRBsdE4vcvp+0YHaj4r3/6UQW9V
         xFAA==
X-Forwarded-Encrypted: i=1; AJvYcCWqTpBmBLssIBi5kJy6qZQLEjwooG1Zp4T4I9mtnlRGW4E7amqeljFrz15A6oZQElzlfKZjMTdCzlYOq7xXrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9KJKgIP0Q8N9Ygi7blbAmzqvRNX3rWBrfpgbqNuirLHlUpmn8
	PWBPJGcUAZ2BH3dUZ7sRmoCKzp/ncYMv0yZtDDIZpZzeO2M+2Faw+K9by7Dp7qk7e201xQMXPGT
	I8I/yS89QRZKC4nwNAgG0TVWUBfjYOe4=
X-Gm-Gg: ASbGncv7fDMDGR1LzKqhBE4Hma/EKMdrY5DtOSRUn4ZR0iXRg9WAKpFYiLZoOXPGE03
	gcoeqfEx9sfQPzyr+aGCP9zaguT5VIuDJGrtLNzxlLqqiKYPwJhuRGvOICVYTV0ST2daG64fxgL
	MzaV/lrO7IMiP4V4AY5slKHMGftaJL6AgrwSMSb8fubANRDxTgYgu/FZSvzAQOMdBbCUlSEeZ5e
	MwmZcmMwgAZVr/i0qCULo4dUksMnODvcD6YOvJYfw==
X-Google-Smtp-Source: AGHT+IE/ruZR0Nl+gZjd7KSfaZ+4Yt5azf8Eoz6teA2EZ5XcCIQ6BBXF8AxOCZshaSTrV+l7WDzDAJYCcqNIJ+IMELc=
X-Received: by 2002:a53:cd0e:0:b0:635:4ed0:571e with SMTP id
 956f58d0204a3-63ccc4fd4b5mr7697871d50.22.1760064522649; Thu, 09 Oct 2025
 19:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-22-safinaskar@gmail.com>
 <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
In-Reply-To: <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 05:48:06 +0300
X-Gm-Features: AS18NWC-iakvkxLfUlO1LRxakg0fg4KV7Trw_hsIF2wxGpnmpWZvHTCQ7Z3GaoE
Message-ID: <CAPnZJGDK08eDWaMTmvVQwkAAThUvgB0XgAapqqV4_ZmWeay-iw@mail.gmail.com>
Subject: Re: [PATCH RESEND 21/62] init: remove all mentions of root=/dev/ram*
To: Krzysztof Kozlowski <krzk@kernel.org>
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
X-CRM114-CacheID: sfid-20251009_194843_799002_A8C51548 
X-CRM114-Status: UNSURE (   8.48  )
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

T24gU3VuLCBTZXAgMTQsIDIwMjUgYXQgMTowNuKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gUGxlYXNlIHdyYXAgY29tbWl0IG1lc3NhZ2UgYWNjb3Jk
aW5nIHRvIExpbnV4IGNvZGluZyBzdHlsZSAvIHN1Ym1pc3Npb24KSSB3aWxsIGRvIHRoaXMgZm9y
IHYyCgo+IFRvIG1lIHlvdXIgcGF0Y2hzZXQgaXMgd2F5IHRvbyBiaWcgYm9tYiwgdG9vIGRpZmZp
Y3VsdCB0byByZXZpZXcuIFlvdQp2MiB3aWxsIGJlIHNtYWxsLgoKLS0KQXNrYXIgU2FmaW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMt
YXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
