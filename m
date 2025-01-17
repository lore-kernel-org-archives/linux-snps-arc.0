Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8694BC02188
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Jan 2025 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwQD5BOnpK7s8Kxy28SgOC4idZfB+rygSwqPkXkzMXc=; b=ce5DmTli0w783u
	YiiU2uUEwCatg9Y922Z9trn3eZa2hsMO593VTxGHYgSXXI1KfIf/R1w12CB/cjflPw3gxm+6d6Pzr
	6d7vB/+nPGI/lEJQk9IqDVcfd2wMF8qsMJJpRT8hMVhPIzAOi57cTldGDth67nl1TFT8bsMpGP6zo
	gxwOU0gioErzVTtg/iTmjAocEP1SQD+ECVVYXzp9TxnhpwAZMXs9875tE62eUCFW2fRiJzzu6CNgL
	y1Z+esjv8SDlhQEjKSmeImnRYEWen4zRI/QLlhnmcTD7RwUelQc96fhwLC3/A1YAztKidpK4M86ot
	09ZLTCiBh01CWi0WNvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoZo-00000000fEC-12ya;
	Fri, 17 Jan 2025 15:48:04 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoWa-00000000ehg-1qYy;
	Fri, 17 Jan 2025 15:44:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso3235418a91.2;
        Fri, 17 Jan 2025 07:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737128683; x=1737733483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whHgpC9NdP83/YfvPy6m/Zm1/eSoIWGpN2YA1mG9PX0=;
        b=AupTXCk/gy4HR81fQY98Qhimc5PdfQk8YWRsnbSwSno0m9nU5hbZJUGuiZHHIVPfom
         XhyoH55XW94DPPIsx9KupKRkGWiaqQ1VYX5GahctCKkNeypL9pog7H8ngmfqxdroAI5J
         Ni3GDMS71UAPLLatHqEyeaBjVm2TKUUCLbG2lXfqMM+/z64+QYBseaQ8fjazeE6tz80F
         ocMrIS+I35QrrdLx2w0u1Njs+sIu7HNBgoxnHryoyxgzGzrR/8tRneB96yoR7HCfzJG1
         EqRz515VFQfw0r12ahxGqmvZspS8zFCJegWUUlM1bPfkJ1uUkmz7n6obvi7YGWR802qB
         Na+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737128683; x=1737733483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whHgpC9NdP83/YfvPy6m/Zm1/eSoIWGpN2YA1mG9PX0=;
        b=hnF1jIK/ctQhFmjzRfOmV+SFAvlJF4fsBfzmRSs6ftT1+TgUK3mgUoyChnFKu+RnM7
         jPD9EZp3r1hvxwd546PROc5jAIA6Ng3sq5yr/f1v1JSEjWgpePuFOvSaGmneTDHRDWtZ
         weA1H6GgIZ7Mcz4AX/R8T7K0yLHIwbPeSOPH6OwsPq6G6Vb7UJ+yiW45ERNmtyaNioZQ
         qD1KnyW+trX98KpmYLKMcuUkLTxIZ4DrH0hY6vJ0fwzht0ckyj8CD3DS1yti9TKIfvJh
         NunHUHGHk5Ai2kammFuA/vfqqYEopxkPgc3t4niLxpUT5MRLOCrtMtcgz+B6+CO+5spy
         QlNw==
X-Forwarded-Encrypted: i=1; AJvYcCUyCdhh7+J/IuUVx+QblxQOX9cDxa+BpNyZ/00pBGXzJ/ujFFDxabXutyqbADfD0bYcwQ/7EaZemkg=@lists.infradead.org, AJvYcCVfvs881vmehnW2NAaw/Nj+yUODnAzw8e1rdhBYIy9bK3dAn54iQV7kqfpunjg4wAtmqp7RF+PaYEh+zGuGF4O3@lists.infradead.org, AJvYcCVgjO6uXtigJFjTjK4e+SyRretF2orvbRHTz0jFYp2P31BZqL5qOIaSjaRV8BxiX9JdezbvYiv+YA089Bw=@lists.infradead.org, AJvYcCW7IZ3YEAar7wRjJ8J/7nEWaAux5MmIEnS9QDpd+TG0BhQPq/2BG2pjzZkzpcEbHji639iQ+XAggc1nk27JNEI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPN1KS9JzTqr4z7ugMBMHDqKPNR+ZwZOCi4WtPxwM+p4hM1Y04
	RBRWXH52AjuTtits4hB7LJrY9J0ZMcRFdya+L7xEfmUGqtoaK6gnuAIg1jJ8N3x249YKZ8Td9rS
	V6TGvt5zmOPk6EHK389obqJ79yEc=
X-Gm-Gg: ASbGncu7CkRXuXImdZ1SGz8aUkMCXhg5gEPEEjvAUBKyHVsCHm23qHO76guSlwrlzan
	qJwZOsmf038JZ5LP7Z6DtD5WTrTArBljN+MzeFA==
X-Google-Smtp-Source: AGHT+IE6c+RDPkVhdYpGhwJjY3swM/Kqbs9TiZQ1EhehCnKjqU+fLUq40RYGPSLu28v4p+m1VfknK3ci2deVkxFc/zo=
X-Received: by 2002:a17:90b:54cb:b0:2ee:df57:b194 with SMTP id
 98e67ed59e1d1-2f782cc011fmr4009658a91.21.1737128683175; Fri, 17 Jan 2025
 07:44:43 -0800 (PST)
MIME-Version: 1.0
References: <20250113170925.GA392@strace.io> <20250113171140.GC589@strace.io>
 <Z4hs0X8RhGTuevnn@ghost> <eecada37-9d0e-4e3c-9b70-fefb990835b2@zytor.com>
In-Reply-To: <eecada37-9d0e-4e3c-9b70-fefb990835b2@zytor.com>
From: Eugene Syromyatnikov <evgsyr@gmail.com>
Date: Fri, 17 Jan 2025 16:45:02 +0100
X-Gm-Features: AbW1kvb78AU_0HrrHV0OtjwO2uAvukZ8DnSGASVo_9Ya8_h5NunDjjnSIP4voz8
Message-ID: <CACGkJdtAmtxsPiKYUzLLmfNGf6oJ9YS-25ZY9VvEEWhz37Qx6Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] syscall.h: add syscall_set_arguments() and syscall_set_return_value()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>, 
	Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>, 
	Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_074444_481119_D5E917BD 
X-CRM114-Status: GOOD (  13.72  )
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

T24gRnJpLCBKYW4gMTcsIDIwMjUgYXQgMjowM+KAr0FNIEguIFBldGVyIEFudmluIDxocGFAenl0
b3IuY29tPiB3cm90ZToKPgo+IEkgbGluayB0aGUgY29uY2VwdCBvZiB0aGlzIHBhdGNoc2V0LCBi
dXQgKnBsZWFzZSogbWFrZSBpdCBjbGVhciBpbiB0aGUKPiBjb21tZW50cyB0aGF0IHRoaXMgZG9l
cyBub3Qgc29sdmUgdGhlIGlzc3VlIG9mIDY0LWJpdCBrZXJuZWwgYXJndW1lbnRzCj4gb24gMzIt
Yml0IHN5c3RlbXMgYmVpbmcgQUJJIHNwZWNpZmljLgoKU29ycnksIGJ1dCBJIGRvbid0IHNlZSBo
b3cgdGhpcyBpcyByZWxldmFudDsgZWFjaCBhcmNoaXRlY3R1cmUgaGFzIGl0cwpvd24gQUJJIHdp
dGggaXRzIG93biBzZXQgb2YgcGVjdWxpYXJpdGllcywgYW5kIHRoZXJlJ3MgYSBsb3Qgb2YKKGNv
bXBsZXRlbHkgdW5yZWxhdGVkKSB3b3JrIG5lZWRlZCBpbiBvcmRlciB0byBtYWtlIGFuIEFCSSB0
aGF0IGlzCmFyY2hpdGVjdHVyZS1hZ25vc3RpYy4gIEFsbCB0aGlzIHBhdGNoIHNldCBkb2VzIGlz
IHByb3ZpZGVzIGEKY29uc2lzdGVudCB3YXkgdG8gbWFuaXB1bGF0ZSBzY25vIGFuZCBhcmdzIGFj
cm9zcyBhcmNoaXRlY3R1cmVzOyAgaXQKZG9lc24ndCBhZGRyZXNzIHRoZSBmYWN0IHRoYXQgc29t
ZSBhcmNoaXRlY3R1cmVzIGhhdmUgbW1hcDIvbW1hcF9wZ29mZgpzeXNjYWxsLCBvciB0aGF0IHNv
bWUgaGF2ZSBmYWR2aXNlNjRfNjQgaW4gYWRkaXRpb24gdG8gZmFkdmlzZTY0LCBvcgp0aGUgZXhp
c3RlbmNlIG9mIGNsb25lMiwgb3Igc29ja2V0Y2FsbCwgb3IgaXBjOyBvciB0aGF0IHNvbWUKYXJj
aGl0ZWN0dXJlcyBkb24ndCBoYXZlIG9wZW4gb3Igc3RhdDsgIG9yIHRoYXQgc2Nub3Mgb24gZGlm
ZmVyZW50CmFyY2hpdGVjdHVyZXMgb3IgZXZlbiBkaWZmZXJlbnQgYml0LXdpZHRocyB3aXRoaW4g
dGhlICJzYW1lIgphcmNoaXRlY3R1cmUgYXJlIGRpZmZlcmVudC4KCj4gVGhpcyBpc24ndCB1bmlx
dWUgdG8gdGhpcyBwYXRjaCBpbiBhbnkgd2F5OyB0aGUgb25seSB3YXkgdG8gaGFuZGxlIGl0IGlz
Cj4gYnkga2VlcGluZyB0cmFjayBvZiBlYWNoIEFCSS4KClRoYXQncyB0cnVlLCBidXQgdGhpcyBw
YXRjaCBkb2Vzbid0IGV2ZW4gdHJ5IHRvIGFkZHJlc3MgdGhhdC4KCi0tIApFdWdlbmUgU3lyb215
YXRuaWtvdgptYWlsdG86ZXZnc3lyQGdtYWlsLmNvbQp4bXBwOmVzeXJAamFiYmVyLntydXxvcmd9
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1z
bnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJj
Cg==
