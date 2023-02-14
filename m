Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C955DC05027
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkXQzS0/va1OpvVlLJa3FZ5bn44Ja+CNbrpjtf2nX0M=; b=UfPHRmMteqF1vB
	1hXcwJD59n8bDuAsn12D2odKbiFMraJ49EkIS2mcddTA3b2M1YPRKrrjglZ1eZIKafCjvV83nHjDr
	06kw/wvVRhLOPSf7Ii0OZhXL4xEQBrmG21/HyN9kthYL9YaZLw2R3+68s6HipCM4p7TrsFpyVa07r
	du/8EfaQwcyg2BKz0ACQT2uZVnQxj6vO5nvCT7cqmyUm7LmtMUFRAA+oZvT3oz2VT55qV/EJVrR4f
	EdYKMywX53VxvbNEzar/hIJL2Zzgt9YRCwEtINRgtVLjvLYtjsX1g1KJvMKXLuTD0qoyYvURH5n8a
	nKliddCmfgRXLR3MAPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrGs-000dlz-Cm; Tue, 14 Feb 2023 09:06:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrGp-000dk8-F2
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 09:06:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id z13so10477768wmp.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 01:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrd61pIHrQzmg4nsVKgkd/XXpTIpHaY6sSTMHOrhSXA=;
        b=OjxC7QQwmF9zY3g/4GkOU2LzN1229KFU+q2E5z/etnUt3sKGkRcmafL3Y8YGfN8UoH
         /hA0Og6bQxUjDsLcLUBFud+jhM3hpqUQChsTdeXNp0tkKdVh8tevnFLlHKLxoOYq+5xL
         Hi6CbSJ5kXMYb2q6/nwBbXnClXiYdCGxqUZS8ITbAu8oILSq9JbNtSn9tIwtBoSPdAYs
         kOnqVm3rrx3zCADZ0mYNb2ZWJ5WCMVL/uJVdwicgJyr5x/KPBBOtEjuDsBeA9K3W7Qrz
         TMZBc98TRM7eH3aNDw0+OEuw1gtcuxCOkgs2RDAkkGjl9mAAfAf7OaWzL1J9MXbvPMm7
         tVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mrd61pIHrQzmg4nsVKgkd/XXpTIpHaY6sSTMHOrhSXA=;
        b=Qzqk4rf9jQFeoAJkHMpi6viRT+3IRczDj168ErGd1dQXs3d3gU5YaA8lRZ3twgjm+g
         wEmbIWEWZ8oSgvajl6TB07uoq4fNi6zeGBUUAi050Pi5pCe1+BT0fEe1sOPXktRRqJDO
         RGmgPJxaQ59byT5gzQLekTRsArC6tAWqqQtrLgWDTv9cC2O+Lsy9ZtSiDyxcAnkg5nhX
         UvjbA9a+Q9HTBCHM/+0TcMyU362gpOcktxK+34utbE7cXcwFuJdSkaWgSOpJ35DJuaAY
         QCEqyOvlvLX8QQ9Y/minJINAnVTJpZpGQ7c6kRXKQXryJ7mwq4L0eHmKkFXJa3zdUp89
         Zdiw==
X-Gm-Message-State: AO0yUKUxtHnjy5ht7lNso+/WszhNyV/hzp4y7G5XKJqM0P8SmG504Afs
	46ZQPNijCWuaiep8/TwdYG8lAw==
X-Google-Smtp-Source: AK7set9MiM4/caZ+oETuVXovz1fIhowKvB35m6VhOBkhclAa3qSu0wh7KMvERZsT3+tjLvnUvDpWqA==
X-Received: by 2002:a05:600c:708:b0:3e1:577:80f4 with SMTP id i8-20020a05600c070800b003e1057780f4mr1429963wmn.18.1676365598212;
        Tue, 14 Feb 2023 01:06:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id p6-20020a05600c468600b003dc36981727sm21222346wmo.14.2023.02.14.01.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:06:37 -0800 (PST)
Message-ID: <30e92251-cd6a-f1d9-a952-7c2fc427cb7f@linaro.org>
Date: Tue, 14 Feb 2023 10:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 07/24] mips: Remove COMMAND_LINE_SIZE from uapi
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
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
 <20230214074925.228106-8-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-8-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_010639_525245_73050ECC 
X-CRM114-Status: GOOD (  11.75  )
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

T24gMTQvMi8yMyAwODo0OSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEZyb206IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsIHRo
aXMgaXMgbm90IHVzZWQgYnkgdXNlcnNwYWNlIGFuZCB0aHVzIHNob3VsZCBub3QKPiBiZSBwYXJ0
IG9mIHRoZSB1c2VyLXZpc2libGUgQVBJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICAgYXJjaC9taXBzL2luY2x1ZGUvYXNt
L3NldHVwLmggICAgICB8IDMgKystCj4gICBhcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9zZXR1
cC5oIHwgMyAtLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGlu
YXJvLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXNucHMtYXJjCg==
