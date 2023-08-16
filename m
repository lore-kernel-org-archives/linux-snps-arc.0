Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62F8C001B0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Aug 2023 07:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+uLy+cJOdrMmblW9CyqE2kmo+qItU3fYHAA5SrmV+mM=; b=ZGa9ZeLvkt41nE
	5W0YI310WLfzuN90Lpe/DE98ESchLOCFYGRfw3s4DK0ZTZcykI8cztCoo3hD+oOvTm/DKuHhfeY1i
	Eg6LQL79K8C5eiJ79+RHBDjbRDRwjlMvH1ZGUXuLbteJ5h3WwZoJ0jrBde1nOGqgGNSXEXCmzZecV
	x+lr7mO9GdqFwqJZHb/lXREISOiaq541QM8H6Yzqyg6wPwiCpnHcQwhce6IfGgpCTlMP1MkT3F3N6
	avBercPoReq9JkWofLw4Oiu7IVfubIa51hNQyXiOxl+tQxmEltjU0XaWFNz7w0W0JVvJ1j5ggWOw7
	ZcOddmcjnBrE3/wXEEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWBHS-003R8o-0W;
	Wed, 16 Aug 2023 07:49:26 +0000
Received: from mail-vs1-f49.google.com ([209.85.217.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWBHO-003R8C-3C;
	Wed, 16 Aug 2023 07:49:24 +0000
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-44768e056e1so2656549137.1;
        Wed, 16 Aug 2023 00:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692172161; x=1692776961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkTNstwI73s4YFo3/SQhtE6/OXSa9yBSjbdY7mJiIyI=;
        b=AzfzuA2VbeBAVCh5h5ar0uTrTH8W4RxUYeZfJb9M+ChQjH5Kf/e3CZptQs1HjuVicm
         hAvif7dfRHOhhBeYZwWEBwzbjgOGj3GdiHFewKq4lwM2EJI1fPshKrhjq7wJ7vSe4yzl
         hd+bY7KEpqRN/HtgcDOK8AMds4I0sJULQRxl5ysqSPqaisJcwGlvZNvkdVmP7pk85JKz
         kQvb5YYARFbOY+5YgWT1eCY0nYpZnGsezeLuDevLULrxVRc2sJIbBfSA+0LKeVRZvQ0g
         YwyfVhjiMcGvAy6M7uWC0CWqR30wpDVWO71FhYaTetO3H4cK+gg7jdShw6rqdpfGCI+c
         yKsQ==
X-Gm-Message-State: AOJu0YyhkA0WkwJbTgHatkuhARZALGL2yJXfscwwZ2NBUg4JKRTvHNsB
	mKU3H3PzSRAoVb6MtwMebP8/uClhibBAqQ==
X-Google-Smtp-Source: AGHT+IGfTZbBpXQH8StsMCuw3eH/o7n4F1P7xNqPB0A926ta9np06a9QU3duu24TI3wOccc+4etwjA==
X-Received: by 2002:a67:ee55:0:b0:443:5809:ec21 with SMTP id g21-20020a67ee55000000b004435809ec21mr856266vsp.17.1692172160992;
        Wed, 16 Aug 2023 00:49:20 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id k19-20020a67c293000000b004496c07240asm1431947vsj.11.2023.08.16.00.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 00:49:20 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-44768e056e1so2656544137.1;
        Wed, 16 Aug 2023 00:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:76c:5715:b4a3 with SMTP id
 de17-20020a05620a371100b0076c5715b4a3mr1484328qkb.13.1692171688197; Wed, 16
 Aug 2023 00:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230816055010.31534-1-rdunlap@infradead.org>
In-Reply-To: <20230816055010.31534-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2023 09:41:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF0LseSGK6=aodXaoK9D16mxok4DDRs=gKoGox8k6zjg@mail.gmail.com>
Message-ID: <CAMuHMdWF0LseSGK6=aodXaoK9D16mxok4DDRs=gKoGox8k6zjg@mail.gmail.com>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com, linux-arch@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org, 
	Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	linux-openrisc@vger.kernel.org, linux-mips@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org, 
	Max Filippov <jcmvbkbc@gmail.com>, Josh Triplett <josh@joshtriplett.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_004923_032589_10A3F559 
X-CRM114-Status: GOOD (  16.02  )
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

SGkgUmFuZHksCgpPbiBXZWQsIEF1ZyAxNiwgMjAyMyBhdCA3OjUw4oCvQU0gUmFuZHkgRHVubGFw
IDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+IFRoZXJlIGlzIG9ubHkgb25lIEtjb25m
aWcgdXNlciBvZiBDT05GSUdfRU1CRURERUQgYW5kIGl0IGNhbiBiZQo+IHN3aXRjaGVkIHRvIEVY
UEVSVCBvciAiaWYgIUFSQ0hfTVVMVElQTEFURk9STSIgKHN1Z2dlc3RlZCBieSBBcm5kKS4KPgo+
IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgoKTWFr
ZXMgcGVyZmVjdCBzZW5zZSB0byBtZS4KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
