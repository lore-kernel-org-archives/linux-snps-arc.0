Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA9ECF07BA
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Oct 2024 07:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSN/NLhQ6WMKfGvEbrx+0nT9R2fNFtdni5hWvWMHDnc=; b=oPlaQw5HSlMmQZ
	b+tkj+YAQYAT5Oy7KfQ8U4mfmui/tqrZMTJpXV2ok0uNGhzG+iYf8jpbHxoq/03tYTZvZmjtWXpvm
	irip8MGyOWuz0fbVRd8vgppAzbUgpiBooaolA4qH5V6v+CZ3qCsPk4aPmGWoPPFhIdaLKjtyyVpIo
	0hDOq7iDDe6C3wk7L5CRNfJfsjhtmVRXdKtw0fc5pHrAnpGGu/pOIw06SWkGUqttbxMUp/OlH+nEY
	O+98EwfrIGC0MF791q4JBrc9y+yXv2eEFo1EIg7S/BZEofC+yCTNpYeXzOERTY3SjBTpMHZSCebD+
	90zy6qy6hnaA+58X4WaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synua-0000000BsFe-49EQ;
	Thu, 10 Oct 2024 07:48:41 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synaQ-0000000Bpsa-1C5J;
	Thu, 10 Oct 2024 07:27:51 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c71603217so4598185ad.3;
        Thu, 10 Oct 2024 00:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728545268; x=1729150068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cEkDPRbXErPkgoWEGdbZCw32b468GFBk0qa08gpGWY=;
        b=JL3PXmYAxKpKK7eJcH21a2iULrhmFnhaJHSoD2C8JlKlbA0kkDz+nIU0qQCTLshzdg
         NMJGTIRWnqb991IAY3TONZ+gYxf5nGwdaCI9DSIi/U4DG+98d5mvtLaZBviF+WT5OnEE
         C+RtpZp5d+ZxOhwQDWa/GVd+Tm8+QY+9xZu9nnbR8DBGkhgSIUrat8pEl8Msj8Cw68Pe
         MtTGaeKP/batrQ1ZJ2pINLe+O25s09MW/+UuBDev7BIA1uBfNzf5NopNjw71RIXOkU49
         Yuat9BVP+7jQ5oH8yNxcffBN6kszmnvx1L0/Wyf3TFgZgCBMkuvHayw8c0C4hIfQfVxa
         HZLA==
X-Forwarded-Encrypted: i=1; AJvYcCV+f0XL1e1J/jfZyAyvmyWDFzOYUkkrVPmKzsXxr9GUBqf352ouAHcJjuCMjs3Z5YpUyqaYJ6YJ1sk=@lists.infradead.org, AJvYcCV/6y58OX5huADWLxzNEU4r/7rTj0f8bzonqmKEPrbjtvYfmqgnHfnYYjbRlRDSoNBCDSk5MkzQPYvWEzE=@lists.infradead.org, AJvYcCWSW3agXZxKFG8kxZtAOX4qscy7Gs2pj/v77xSy8q5tlLH6V4hCl4CJxgQoDjvsIOHbhTtPyt67TxeYU2mGQzVu@lists.infradead.org, AJvYcCX2wxCfGeDxp59yyjpomdUHfHZfoTQlb3ZuqGuwbPePbPUc2qI0nm/hm1KGB5SyVNmK4lR6UYEApi/5Bcc+k40=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYNnnBWlG0bhcbeE/BtgwKHJFVPs++Ge6G1nY1bWPlvaNGlydZ
	cw3SyvQA+7ZbXS/KMAXD8B1A9WUNOCycS8X4wVbTmIE5sO7h4QjnmObUK9Jo
X-Google-Smtp-Source: AGHT+IGEAkoNIuAMVc1Kkymuz1Dp4pBnT9ffPI8C4o0lwtwRYuJ9ebA/QgoriRGd/OI2S7pc9rOiZQ==
X-Received: by 2002:a17:903:2ac6:b0:20c:5da9:edff with SMTP id d9443c01a7336-20c6377dbb8mr63654695ad.47.1728545268466;
        Thu, 10 Oct 2024 00:27:48 -0700 (PDT)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c215edfsm4477065ad.210.2024.10.10.00.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 00:27:48 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e038f3835so629997b3a.0;
        Thu, 10 Oct 2024 00:27:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvXisdW/jB0p/k5+tM+NAZLkAvdc+dyxjIQLKs9bBpynAr0mw5kJ743Gm35w4Ie19wk3mEKMjf3RmeWIlXR8Q=@lists.infradead.org, AJvYcCX6Y1mMVBQcinESJcnX2y29oLkdZ37/cFase+dJDdUcXm0z/owjz5ScBRKJeTO+uyq95gBgU4uegUM8Pzw=@lists.infradead.org, AJvYcCX7AUj/b/dBdix8zn6PJ03RA8uplYd6lV9+xwtnrQ3N/tjdbPowLX9jpCTyeVDz9BSaIjBS76IzO6k=@lists.infradead.org, AJvYcCXNMQ0sUiefI14z2HKG8LC0YKKC5ym6xHm4IiAeVS2qwFjKgpyxtMakYEdYmWBcSAZvBO8GkfaNynOLJOhsF5Et@lists.infradead.org
X-Received: by 2002:a05:690c:60c2:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6e3221867cemr55553697b3.3.1728544955686; Thu, 10 Oct 2024
 00:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241009180816.83591-1-rppt@kernel.org> <20241009180816.83591-4-rppt@kernel.org>
In-Reply-To: <20241009180816.83591-4-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 09:22:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9TPH+mDJvvuRO3RBYfgWRwvv1kwyr_iLNju+iumb96Q@mail.gmail.com>
Message-ID: <CAMuHMdV9TPH+mDJvvuRO3RBYfgWRwvv1kwyr_iLNju+iumb96Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] asm-generic: introduce text-patching.h
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_002750_368956_85F40F82 
X-CRM114-Status: GOOD (  17.23  )
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

T24gV2VkLCBPY3QgOSwgMjAyNCBhdCA4OjA54oCvUE0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJu
ZWwub3JnPiB3cm90ZToKPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoTWljcm9zb2Z0KSIgPHJwcHRA
a2VybmVsLm9yZz4KPgo+IFNldmVyYWwgYXJjaGl0ZWN0dXJlcyBzdXBwb3J0IHRleHQgcGF0Y2hp
bmcsIGJ1dCB0aGV5IG5hbWUgdGhlIGhlYWRlcgo+IGZpbGVzIHRoYXQgZGVjbGFyZSBwYXRjaGlu
ZyBmdW5jdGlvbnMgZGlmZmVyZW50bHkuCj4KPiBNYWtlIGFsbCBzdWNoIGhlYWRlcnMgY29uc2lz
dGVudGx5IG5hbWVkIHRleHQtcGF0Y2hpbmcuaCBhbmQgYWRkIGFuIGVtcHR5Cj4gaGVhZGVyIGlu
IGFzbS1nZW5lcmljIGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgZG8gbm90IHN1cHBvcnQgdGV4dCBw
YXRjaGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJw
cHRAa2VybmVsLm9yZz4KCj4gIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9LYnVpbGQgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBs
aW51eC1tNjhrLm9yZz4gIyBtNjhrCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
