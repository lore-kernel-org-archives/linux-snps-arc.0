Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25101CAC59A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Sep 2025 18:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnKMBBGCt7dCePy4JHAbiBsDMnrKZ0dfKEI7MTpa4MA=; b=tu8AdOg3lH82CH
	pGLlVqSvp1DIZwrTjjbKETj9VJU0288q4hJQc2/Kvthfxua2SCngC8vnhevUMex/qn+ghgswuTU6t
	nj5C38V8ldQQ25JjNZY9YxiMdgQaBXmz5Nchl/wgCQFKV8g4G477OqdeDMxNrk8YnUl2RexSqcxnj
	McGdwatkOW3wWgTo5AMK3AI+TonFDAg9aTUfevUWrvyAS3FAeL5pZN/VOD6zVdpNC9s81As/fKJTo
	dHlmEgYFxin3ATXrUvaV2zgrGzfjaRBf8SNh6ONcq1ADLggG/h49VQU+uhPTEuSag/08p+NTWyLYZ
	MQkVqeHz+6fNTsQTnkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywSX-0000000DmJg-1ymn;
	Wed, 17 Sep 2025 18:00:49 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywSU-0000000DmGx-2ruM
	for linux-snps-arc@lists.infradead.org;
	Wed, 17 Sep 2025 18:00:48 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5720df4acc5so83164e87.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 17 Sep 2025 11:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1758132044; x=1758736844; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Pv4dFUExNQfPloEDat7jfEF9BkjeLOy7zrinjdnc80=;
        b=Agaxb47fWWscp5fHcKjWx1BUlEcMARV6BL8Hiey9V7JOeiCJOnHvuGhhwvjAx23Lih
         p9oEOCyrZgbOn3ETKICp1ccv/Z+q0M0YAkkmFn/FszIe0ScFA+tZq4/EuXv/UZDR2QTY
         fha+oGwCTgiEYDZ/1yyO62mz0YzbauhvVSxTC9yqV6DbYJ9xboXziVT+2tnOA0pb5Xew
         Lz5nupiiGYTL0eKkz3fBQBgbtVKSyf6i1Q4s+v5nUkNhnIyqUa9x7R0eKTTitjWkwqlx
         DI0rQW4KXV/AQVDG31rJZvQsMQ/1bcNuKI2p7SWv/hZ28tMlJt87EpK5YCK1otPxQJya
         ohYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758132044; x=1758736844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Pv4dFUExNQfPloEDat7jfEF9BkjeLOy7zrinjdnc80=;
        b=jgTmJ1L4LkMkCSK9evUyIskUjKxeu+HmAxcJxldadt4bn/FLvHdyy3o6NFVU8IqxUK
         jzxpHSBhsIUIEOuYE7SVUdBVy6gOXggXM5PBLETxAiK6H4nDAxtFH6NG8GrB7lBVVJ7t
         ljN36rnwgOnXH7XwYrEnKez6TfocnlgHRZReyOoE9YstWzQpB6CdVlbOl3xWZKOCMax2
         F6Bn65fC3UEKHH6+isSiCSSKxsBMXVms4W5jLzBYt/h6pYz22C3hS9kd+FGXa52+Kn4a
         MqkG6g5a4u+5suyJj945DXzxgnsylbi2CiHErPECGRtBlDYz4Q0qAB9OcWZxaTdISHkX
         osgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp1eQtnNAGcSz0iMSYUZ7oO4Ap604qAyhhUq88n7xN65PNSUx75Gq5cOWf564aFj0McJMpK60p+8i7k0ZrMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzspk/ZtppRAf33Qwxu5fYiRbwP2ixKKFTR9TnLfp9//RdhV4eZ
	YWrfTAvPL77rnLNhRDKSBff/t+RNcZomxuggV4NgMJunPYmRVbuKr4fXvIqqyY+scecS0FSDJsQ
	xtSexGszLu/QKJgY0L3jkhA3wHvl0QqSErNVQfabd
X-Gm-Gg: ASbGncsVpbGh6fRsrfgFPsoPjmEQLEiEr5ayXj6VDAf+6bjmnmlUBw5wrBwdY3RlRnR
	Qb9oKSm4HGJNY2JfSMTC1WtXZE1hLzOSuVjSQY/QEGBZKzxyo0PGFaCEuliCUzky+5hQNcZ5jzC
	WrVNMSSvkBvcxdXLNiornRksuWT5SGD/8WmbyH7GogRK/ifntYntJaY601RbxonWEhT3l4p+He4
	gePQw==
X-Google-Smtp-Source: AGHT+IGI+xF2OSgRbI6+fabXiqu9Xwuf5bxWYwnja/rNGOUuSmNzhH42MNUAKuR34Ox7ov8nmiujA9clDhMS84oRbmU=
X-Received: by 2002:ac2:4e09:0:b0:576:d217:3f2f with SMTP id
 2adb3069b0e04-57796b5e819mr1028160e87.3.1758132043747; Wed, 17 Sep 2025
 11:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250912223937.3735076-1-safinaskar@zohomail.com> <0342fbda-9901-4293-afa7-ba6085eb1688@landley.net>
In-Reply-To: <0342fbda-9901-4293-afa7-ba6085eb1688@landley.net>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 17 Sep 2025 11:00:32 -0700
X-Gm-Features: AS18NWAGwakGZ9zjxjq7MnfN8O7ZgOJb6fmKIJ0JIML7P3j0NnlDZ27eNb5S7Es
Message-ID: <CALCETrXHxOkHoS+0zhvc4cfpZqJ0wpfQUDnXW-A-qyQkqur-DQ@mail.gmail.com>
Subject: Re: [PATCH 00/62] initrd: remove classic initrd support
To: Rob Landley <rob@landley.net>
Cc: Askar Safin <safinaskar@zohomail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20250917_110046_831852_9986F581 
X-CRM114-Status: GOOD (  15.20  )
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

T24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgMTA6MDnigK9BTSBSb2IgTGFuZGxleSA8cm9iQGxhbmRs
ZXkubmV0PiB3cm90ZToKCj4gV2hpbGUgeW91J3JlIGF0IGl0LCBjb3VsZCB5b3UgZml4IHN0YXRp
Yy9idWlsdGluIGluaXRyYW1mcyBzbyBQSUQgMSBoYXMKPiBhIHZhbGlkIHN0ZGluL3N0ZG91dC9z
dGRlcnI/Cj4KPiBBIHN0YXRpYyBpbml0cmFtZnMgd29uJ3QgY3JlYXRlIC9kZXYvY29uc29sZSBp
ZiB0aGUgZW1iZWRkZWQgaW5pdHJhbWZzCj4gaW1hZ2UgZG9lc24ndCBjb250YWluIGl0LCB3aGlj
aCBhIG5vbi1yb290IGJ1aWxkIGNhbid0IG1rbm9kLCBzbyB0aGUKPiBrZXJuZWwgcGx1bWJpbmcg
d29uJ3Qgc2VlIGl0IGRldiBpbiB0aGUgZGlyZWN0b3J5IHdlIHBvaW50IGl0IGF0IHVubGVzcwo+
IHdlIGJ1aWxkIHdpdGggcm9vdCBhY2Nlc3MuCgpJIGhhdmUgbm8gY3VycmVudCBpbnNpZ2h0IGFz
IHRvIHdoZXRoZXIgdGhlcmUncyBhIGtlcm5lbCBpc3N1ZSBoZXJlLApidXQgd2h5IGFyZSB5b3Ug
dHJ5aW5nIHRvIHB1dCBhY3R1YWwgZGV2aWNlIG5vZGVzIGluIGFuIGFjdHVhbApmaWxlc3lzdGVt
IGFzIHBhcnQgb2YgYSBidWlsZCBwcm9jZXNzPyAgSXQncyBleHRyZW1lbHkgc3RyYWlnaHRmb3J3
YXJkCnRvIGVtaXQgZGV2aWNlcyBub2RlcyBpbiBjcGlvIGZvcm1hdCwgYW5kIElNTyBpdCdzIGZh
ciAqbW9yZSoKc3RyYWlnaHRmb3J3YXJkIHRvIGRvIHRoYXQgdGhhbiB0byBtYWtlIGEgd2hvbGUg
ZGlyZWN0b3J5LCB0cnkgdG8gZ2V0CmFsbCB0aGUgbW9kZXMgcmlnaHQsIGFuZCBjcGlvIGl0IHVw
LgoKSSB3cm90ZSBhbiBhYnNvbHV0ZWx5IHRyaXZpYWwgdG9vbCBmb3IgdGhpcyBzZXZlcmFsIHll
YXJzIGFnbzoKCmh0dHBzOi8vZ2l0aHViLmNvbS9hbWx1dG8vdmlydG1lL2Jsb2IvbWFzdGVyL3Zp
cnRtZS9jcGlvd3JpdGVyLnB5CgppdCB3b3VsZCBiZSBiYXJlbHkgbW9yZSBjb21wbGljYXRlZCB0
byBzdHJpcCB0aGUgdHJhaWxlciBvZmYgYW4gY3BpbwpmaWxlIGZyb20gc29tZSBvdGhlciBzb3Vy
Y2UsIGFkZCBzb21lIGRldmljZSBub2RlcywgYW5kIHN0aWNrIHRoZQp0cmFpbGVyIGJhY2sgb24u
ICBCdXQgaXQncyBhbHNvIHJlYWxseSwgcmVhbGx5LCByZWFsbHkgZWFzeSB0byBlbWl0IGFuCmVu
dGlyZSwgZnVuY3Rpb25pbmcgY3Bpby1mb3JtYXR0ZWQgaW5pdHJhbWZzIGZyb20gcGxhaW4gdXNl
ciBjb2RlIHdpdGgKbm8gZmlsZXN5c3RlbSBtYW5pcHVsYXRpb24gYXQgYWxsLiAgVGhpcyBhbHNv
IG1ha2VzIHRoYXQgcG9ydGlvbiBvZgp0aGUgYnVpbGQgcmVwcm9kdWNpYmxlLCB3aGljaCBpcyB3
b3J0aCBxdWl0ZSBhIGJpdCBJTU8uCgotLUFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
