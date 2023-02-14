Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0462C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfUdDcFVznyKWOJKV7zSRlsJ46FrKZ9GKpCh52/myfM=; b=Jz4H1EOMGsHzqj
	vAcaKaTkiKi3JFZOOinhqXn6wRa0BflYip6Y8pwKx1vP9dIxLXkdSKfHs46PXoDc+kwTGLgCE3d/7
	nrUH+al3zylSExejIPHKruo/cMl7MuyOle7jI5qYvLX2REZcADHWqcXxdwBqgUkgKOZ5l9Yivzeqb
	L/7vM6Dnqm9kwiSxjWL2iw9CyP3mNVVR9htbPp6yqtgLFAARZrweLrP7zDscjM17aUIns1N6YLMoc
	7R1uQ5Wo0nnfEly7cgkFUiCJT5sbU7tmYNYblEmwbre0ULUVtRfyJNYZ2LvkDtmU9mbuultGxbCYT
	VwTVdTvzgJ1VcxjzB3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrsd-000mct-MZ; Tue, 14 Feb 2023 09:45:43 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrsZ-000maI-8R; Tue, 14 Feb 2023 09:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1676367870; bh=ERFp+UKx/iNbj6Y6kJUSMmT/xdPleSppwgENqVxf/VM=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Za6u4dReX/HTRyphBPafGiLsxCJ+KKmFXzBp1N3wK/BdK0FrKi1Znyq7KSHyqIyd/
	 kgfg1K7p6XNdoVzNndtK42V0pk1FbtgyitZSCQWfWujqXuBYwphv2YLUpu/j4syKSL
	 9RAZMIGf3dW2anwxyU5UMo1EVcbifIrk3T62A2sIhCPMYdsaAzhIY5t2nwHlg40Zt7
	 HtazUlk5mlSfLPOR/KKhdC1Dq5qLUvlQDvzaYGy2cDXLDVpukIxIWr8q4OHqWuB3tT
	 6cx52IlEbcB5iPGAwJpjsjaFv5wT4dz6E7YwfLhROeby+gu9v1sPXxrdEBwhQ+jslK
	 7mKSZA/LRAQdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.155.167]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9Bu-1ooy3k2CyE-00oHk0; Tue, 14
 Feb 2023 10:44:30 +0100
Message-ID: <32c2584a-8777-26b9-ae29-80df9dfa7833@gmx.de>
Date: Tue, 14 Feb 2023 10:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 19/24] parisc: Remove empty <uapi/asm/setup.h>
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-20-alexghiti@rivosinc.com>
 <6f9c7a6b-4f6b-dead-2d9b-14b405f18397@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <6f9c7a6b-4f6b-dead-2d9b-14b405f18397@linaro.org>
X-Provags-ID: V03:K1:6i9MLH1uyN4UjvbKa9qFgGzxyogAl9vzFG+CnYpeJmhfg1aCjEo
 fgPVjxDy4iWSOp0fQduaCkCLS49XMnxFV3Cebj1wXgxrmR7Mk+7ALLo+bEOtaCQ7LtdzxdY
 sCyP+X8u7wZGNhDO2HoSYGEmEl3/72yEi0kFbG3gxrNGYWo22p1QITkOnVbWjeRtGq3QAhO
 81HzmD9N+fT9Dd0qQJFHw==
UI-OutboundReport: notjunk:1;M01:P0:/sXWrTs+GHs=;mOBmE8xN1RO7T/4g1DSsoRwJcwg
 9UZR9rEyA6LxshPy2Pz3oePTMgiIj4+AJ5S/kMjQzK+6c4x3H5hr27yLtzKfDT5PmjzMBJ+Of
 3zfIEJQlV54kh1Ta/E2FfIdf+80zKMSI52rgvhwMkMmCjI3cvExJnD5nlbysiqstKtT+wFzv2
 Z260NQ1Y6j9s9OOAoLni9UrAct6Rzpr/LUuWUMgXKKuXfF7kU52/jKJgDV1uBFAO6e5+U9ium
 VU7bbslf79RWKAUFAz+cqTgWfg2fuGDImyE9L+3DmCjQMG4Je3gjyU6QTxHzjARx67lC7Pl/p
 bedRk356yNR+IaCi4+oVkCwy2AY9dZJ/arcneDsIauL5AATahoUIulBRN7BP8SDlfJek6s/Jl
 DdbP1C/VuGwfRMSoxHG8JGSkxMV5vKemlpgKIjZBdDtJFI77SS55OS105zLh5z4ZUEQAw5+iD
 gVWGMHv/5YX1gJCtlIOQqpAHCfa/KUliQGzWaNumDuHSbS1WfcGa+yV5bTGOpiX0VvFOGSRQB
 U8RMxnOZrwFy8bBzFJhabD91opgpUnM1Drax9wp+qCBQVYPpwhhcgl6on9cy9pH9R+aFk3mO1
 nccDm7RKozeMO0SgmShqcIoAo/MMXzhU+k4jUwmlvTNKux7KYJMrIZ3ji9OPa5aewlpMHOTna
 SozD4wCdOT6JL2dhqNqhu36n4+0Z9IWZgWgaFVcSdY0J6JSMrCZl1PwuiDm7p3APkGs2WM/5J
 r7eIJOkBYD6bzCYdI23czK+lvIluKLxeFS4fLTCAb1WjYXxNnV13KwV1j8Yk4Fb+FVUt28ZT4
 0LWoGNHs7csGcm5b93meJrBGDiIruUcZg9DNckv8YppQk7vzTqpr/lTUzz0R/0FKX3/+tbfQa
 Xa6y4Nti/opEugZMRO7Vpm0AV2+BhhBkSR95zi7OPWYYGnYk/coI5tYGHEiard+vIs75wAtJz
 L71IAbhumB1qAsU4XQRHfRtAGXM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_014539_603111_A9FAAF5E 
X-CRM114-Status: UNSURE (   9.28  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMi8xNC8yMyAxMDowOCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6Cj4gT24gMTQv
Mi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+PiBGcm9tOiBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJl
bHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL3BhcmlzYy9pbmNsdWRl
L3VhcGkvYXNtL3NldHVwLmggfCA1IC0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0
aW9ucygtKQo+PiDCoCBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBp
L2FzbS9zZXR1cC5oCj4KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEBsaW5hcm8ub3JnPgoKQWNrZWQtYnk6IEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
