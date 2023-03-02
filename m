Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21C4C6FA8E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Yg7+imXAGgv/CdjUr5r7TYxu+8Solz+dyY/4eg13+8=; b=XP+5RJGPHhimiz
	4McAqd+lv8bqJp2RGB5YA1myc2ycYKmpia+jTi6lUSVM3Aw7OtbKG1vwX4QAHhKKpuFteGqeC2y+W
	3/10/xjgGDcV//FIP6isD1dHWrTKQMeI46CQbsfbmBFxdl61Shq+plssIIjIlshY+ZHb7oWZ8XtGJ
	YcYu6wHfEzdbyl2W5hEIhcrSTHaslYVJKfW7sktHaXgVomhRcRG1DcvVRZwTCZrdCTzKA61iCA+0p
	6WlzUQbxCjxs4SOn9odg29bf3J39JJytzxf8YBxVTo3uTSYmQ5j6/9qTXAotxiTTyy7fumLNaffWh
	9G6VTfHTD2/Jr8vMn5qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfXo-001Vin-54; Thu, 02 Mar 2023 09:48:12 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfXj-001Vg7-SW; Thu, 02 Mar 2023 09:48:10 +0000
Received: by mail-qt1-f179.google.com with SMTP id cf14so17333069qtb.10;
        Thu, 02 Mar 2023 01:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFYMa4F5zx6QmdN+xdk9xuKBVfUQIkEC+rLl+xVi7rY=;
        b=u9nxCvQwosNlcwrzQtH2Ra3qY4hlEjd46s+npu1co9ElXY18wD+tYDcs+iemL6ELCw
         ReH+xoy55R6+NrktAdfxUWwUHWlI/HGM3u25TI0uGDOVRygLa5+nhxYVqeaAhW04nGRX
         bDD2zmEkqYsJ5hLjUO0n/TLOfM3z7iIVIKhUgscYtYnuR9lccevsqybHaiTjreKcoXl+
         nY9aO6BNK6U6Xj9coTA6t4OlczBZno718QvjiNNz3Y/ZtqJ6VjcqSdeJtn+K5ybXaPMh
         kY8jEd5Qq8vYV5258P8KuTyK5ZHeXh+aZB+vC44HWvQhM84+96YEw4idiF2okg0qNZ8P
         Nuiw==
X-Gm-Message-State: AO0yUKUhLE4DZEFCOPFA5uV/c0l/LF5m6bl4A1wrPnDkqgbGw1aJ8Lf7
	lle215Z9DlEPEAa9esnenb86KwE+geFVAw==
X-Google-Smtp-Source: AK7set8Egqh077tv6Hfn2UPNQ4jRcHaR8RUB39O7+P5SmGdaaRcrQWc9ONoDP5YWvlYokEQjGbh3fw==
X-Received: by 2002:a05:622a:5ca:b0:3b8:2504:e90a with SMTP id d10-20020a05622a05ca00b003b82504e90amr1921999qtb.3.1677750486207;
        Thu, 02 Mar 2023 01:48:06 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id b15-20020ac844cf000000b003b2d890752dsm9969262qto.88.2023.03.02.01.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 01:48:05 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id y12so11235942qvt.8;
        Thu, 02 Mar 2023 01:48:03 -0800 (PST)
X-Received: by 2002:a81:ad43:0:b0:533:91d2:9d94 with SMTP id
 l3-20020a81ad43000000b0053391d29d94mr5972312ywk.5.1677750462713; Thu, 02 Mar
 2023 01:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Mar 2023 10:47:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
Message-ID: <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_014807_955768_AAAB1689 
X-CRM114-Status: GOOD (  29.96  )
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

SGkgQWxleCwKCk9uIFRodSwgTWFyIDIsIDIwMjMgYXQgMTA6MzXigK9BTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+IFRoaXMgYWxsIGNhbWUgdXAgaW4g
dGhlIGNvbnRleHQgb2YgaW5jcmVhc2luZyBDT01NQU5EX0xJTkVfU0laRSBpbiB0aGUKPiBSSVND
LVYgcG9ydC4gIEluIHRoZW9yeSB0aGF0J3MgYSBVQUJJIGJyZWFrLCBhcyBDT01NQU5EX0xJTkVf
U0laRSBpcyB0aGUKPiBtYXhpbXVtIGxlbmd0aCBvZiAvcHJvYy9jbWRsaW5lIGFuZCB1c2Vyc3Bh
Y2UgY291bGQgc3RhdGljbHkgcmVseSBvbgo+IHRoYXQgdG8gYmUgY29ycmVjdC4KPgo+IFVzdWFs
bHkgSSB3b3VsZG4ndCBtZXNzIGFyb3VuZCB3aXRoIGNoYW5naW5nIHRoaXMgc29ydCBvZiB0aGlu
ZywgYnV0Cj4gUG93ZXJQQyBpbmNyZWFzZWQgaXQgd2l0aCBhNTk4MGQwNjRmZTIgKCJwb3dlcnBj
OiBCdW1wIENPTU1BTkRfTElORV9TSVpFCj4gdG8gMjA0OCIpLiAgVGhlcmUgYXJlIGFsc28gYSBo
YW5kZnVsIG9mIGV4YW1wbGVzIG9mIENPTU1BTkRfTElORV9TSVpFCj4gaW5jcmVhc2luZywgYnV0
IHRoZXkncmUgZnJvbSBiZWZvcmUgdGhlIFVBUEkgc3BsaXQgc28gSSdtIG5vdCBxdWl0ZSBzdXJl
Cj4gd2hhdCB0aGF0IG1lYW5zOiBlNWE2YTFjOTA5NDggKCJwb3dlcnBjOiBkZXJpdmUgQ09NTUFO
RF9MSU5FX1NJWkUgZnJvbQo+IGFzbS1nZW5lcmljIiksIDY4NGQyZmQ0OGU3MSAoIltTMzkwXSBr
ZXJuZWw6IEFwcGVuZCBzY3BkYXRhIHRvIGtlcm5lbAo+IGJvb3QgY29tbWFuZCBsaW5lIiksIDIy
MjQyNjgxY2ZmNSAoIk1JUFM6IEV4dGVuZCBDT01NQU5EX0xJTkVfU0laRSIpLAo+IGFuZCAyYjc0
Yjg1NjkzYzcgKCJzaDogRGVyaXZlIENPTU1BTkRfTElORV9TSVpFIGZyb20KPiBhc20tZ2VuZXJp
Yy9zZXR1cC5oLiIpLgo+Cj4gSXQgc2VlbXMgdG8gbWUgbGlrZSBDT01NQU5EX0xJTkVfU0laRSBy
ZWFsbHkganVzdCBzaG91bGRuJ3QgaGF2ZSBiZWVuCj4gcGFydCBvZiB0aGUgdWFwaSB0byBiZWdp
biB3aXRoLCBhbmQgdXNlcnNwYWNlIHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZQo+IC9wcm9jL2Nt
ZGxpbmUgb2Ygd2hhdGV2ZXIgbGVuZ3RoIGl0IHR1cm5zIG91dCB0byBiZS4gIEkgZG9uJ3Qgc2Vl
IGFueQo+IHJlZmVyZW5jZXMgdG8gQ09NTUFORF9MSU5FX1NJWkUgYW55d2hlcmUgYnV0IExpbnV4
IHZpYSBhIHF1aWNrIEdvb2dsZQo+IHNlYXJjaCwgYnV0IHRoYXQncyBub3QgcmVhbGx5IGVub3Vn
aCB0byBjb25zaWRlciBpdCB1bnVzZWQgb24gbXkgZW5kLgo+Cj4gVGhpcyBpc3N1ZSB3YXMgYWxy
ZWFkeSBjb25zaWRlcmVkIGluIHMzOTAgYW5kIHRoZXkgcmVhY2hlZCB0aGUgc2FtZQo+IGNvbmNs
dXNpb24gaW4gY29tbWl0IDYyMjAyMWNkNmM1NiAoInMzOTA6IG1ha2UgY29tbWFuZCBsaW5lCj4g
Y29uZmlndXJhYmxlIikuCj4KPiBUaGUgZmVlZGJhY2sgb24gdGhlIHYxIHNlZW1lZCB0byBpbmRp
Y2F0ZSB0aGF0IENPTU1BTkRfTElORV9TSVpFIHJlYWxseQo+IHNob3VsZG4ndCBiZSBwYXJ0IG9m
IHVhcGksIHNvIHRoaXMgbm93IHRvdWNoZXMgYWxsIHRoZSBwb3J0cy4gIEkndmUKPiB0cmllZCB0
byBzcGxpdCB0aGlzIGFsbCBvdXQgYW5kIGxlYXZlIGl0IGJpc2VjdGFibGUsIGJ1dCBJIGhhdmVu
J3QKPiB0ZXN0ZWQgaXQgYWxsIHRoYXQgYWdncmVzc2l2ZWx5Lgo+Cj4gQ2hhbmdlcyBzaW5jZSB2
MyA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMjE0MDc0OTI1LjIyODEwNi0xLWFs
ZXhnaGl0aUByaXZvc2luYy5jb20vPjoKPiAqIEFkZGVkIFJCL0FCCj4gKiBBZGRlZCBhIG1lbnRp
b24gdG8gY29tbWl0IDYyMjAyMWNkNmM1NiAoInMzOTA6IG1ha2UgY29tbWFuZCBsaW5lCj4gICBj
b25maWd1cmFibGUiKSBpbiB0aGUgY292ZXIgbGV0dGVyCgpUaGFua3MgZm9yIHRoZSB1cGRhdGUh
CgogQXBwYXJlbnRseSB5b3UgZm9yZ290IHRvIGFkZCB5b3VyIG93biBTb0I/CgpHcntvZXRqZSxl
ZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLQpHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFp
bGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
