Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B988CEE644E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Sep 2024 06:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5t3QHEtV7Y8jdWXvOP8+t+xbLWyBJ65UJiWtIM3gJY8=; b=yyysPKxhb7GdZf
	QghSKdsl82ofP7XAiNBUYwbEgh3zA/XoudT4Yo46SvpgtWoEM4RDqJ8dm2r/wYvj+3d8hjDRWdrFk
	8KN0n0g1Pyr4vcSKGlmZFD40DooM7mYUz6M4vf8mVpFzro/VRqB6lS7YcjkuQHcw8rdXPLC4/ACsf
	DRPjf1ZHD8p2NPtSwLsEY4Zr6zqNp81T63u2FLLcXgN0pc49FimaHxxKLdQaPwLVTDMZE/qDwaoX5
	ze9umDH9BnU5yv+fDAZ+DhGChTSuPxm8uk5d3KzTmnnXj6FWmctFM4PdC6pcuGkkiqHQixtxF1OLB
	85n4B2OGdEfkcsUcjLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sodCA-0000000C0Sp-1GsK;
	Thu, 12 Sep 2024 06:20:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sodC6-0000000C0RM-1h8l
	for linux-snps-arc@lists.infradead.org;
	Thu, 12 Sep 2024 06:20:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2053525bd90so6138905ad.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Sep 2024 23:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726122042; x=1726726842; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MH+VWCTNjiA22bJ+vIa1h0/NxuAZxX6cpAlaipl1hg=;
        b=shnUEsc7yLacvulkfkqKl5rJUqS15JQEWIr91fgU0musF/Rn8LKnPBAj7/KiN5jK8G
         RSCzYkp8If8Tk/Bbr/1obynKiCoVX1C2grilR8k+yHzJFbo7IRJh8Dim7QMIpomdoOgD
         yNkUJ2OuuHwnzDzULUDkARCLHc+hQ3rFFTPsHjpmo9tLbNSjXIXhXzNXYMhXELs8THuP
         D6SxHatHEEGfPjKnTLhLlcQGIQXRLxKYKYnkxs/yvSty61lWk2TzQeCyjm+5Igt5/U/o
         wlOy32+kASMaTIuR1zcCoYJRfv6zQO6mH7sZiMBOlNlkCDwp5QBv76UpQGSB/8dGyg32
         tPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726122042; x=1726726842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MH+VWCTNjiA22bJ+vIa1h0/NxuAZxX6cpAlaipl1hg=;
        b=V/FOyzG4P0XO5Md3X+e9yQ7uySfFnI+Af6FeTRQSyVqfLntCizpc/dKoBdG33d3jUO
         Nksq5iuoAOcoSNtMkg9Vi7b6bGyEgTfrsmgyqSs2vUmmxM4TyCy+w9RKY9OAKhHsGwHg
         jQ7ZUiW+5RZWDVfpSQIIetl2Lh4/V5iKiZpMFKj+MeHiqK0+ZU1/au5iD4GYRfIFLUIW
         BzOpi2LYM0EC5es+ZkkLPgbUVszM8w3uCfX/dwbWNhwqiCrtDZnQYo+e7FxU0zXBB7h+
         KZ6XXsn/Ul6bki41+eeNDNjl4W8p3vWl4IcS5yNdZUqGs31D0kMVCfMGSQZIL75dMl+F
         WHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnL/+K1OfYS8b0tOAMrgaYXwhCODMTjjVFoC+EiEaq344PcbFL5gIRXCjXG29mQotTeo2D5hX3XDcSNlq8aA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8vutlkdTg5PS/HqsiF3Dwir1w3hI00yF0Q0rpqhiTSUZ8IOsp
	NcTdtu/SyeMrDyCgkKLMAIdu5IVMpaJAjJIsLr96v7cCJ0AEItT21fZBFWcC99s=
X-Google-Smtp-Source: AGHT+IEU0tdlu4WO+IdyYZyQDbQui3iM6ZAtkm5A4CWh7CFo7CMKirqsrpvUAjbSGnQEOy1Vcb5RUw==
X-Received: by 2002:a17:903:191:b0:206:aa2e:6d1f with SMTP id d9443c01a7336-2076e423272mr22083755ad.46.1726122041553;
        Wed, 11 Sep 2024 23:20:41 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:7acc:9910:2c1d:4e65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd82asm8286105ad.129.2024.09.11.23.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 23:20:40 -0700 (PDT)
Date: Wed, 11 Sep 2024 23:20:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuKIMz7U8rDrq8jA@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse>
 <Zt9HboH/PmPlRPmH@ghost>
 <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
 <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
 <8734m6s428.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8734m6s428.fsf@mail.lhotse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_232042_482363_59F0CDB4 
X-CRM114-Status: GOOD (  20.13  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMTE6Mzg6NTVQTSArMTAwMCwgTWljaGFlbCBFbGxlcm1h
biB3cm90ZToKPiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cml0
ZXM6Cj4gPiBIaSBDaHJpc3RvcGhlLAo+ID4KPiA+IE9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0IDEx
OjIx4oCvQU0gQ2hyaXN0b3BoZSBMZXJveQo+ID4gPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5l
dT4gd3JvdGU6Cj4gPj4gPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvcGVyc29u
YWxpdHkuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9wZXJzb25hbGl0eS5oCj4gPj4gPj4+IGluZGV4
IDQ5Nzk2Yjc3NTZhZi4uY2QzYjhjMTU0ZDliIDEwMDY0NAo+ID4+ID4+PiAtLS0gYS9pbmNsdWRl
L3VhcGkvbGludXgvcGVyc29uYWxpdHkuaAo+ID4+ID4+PiArKysgYi9pbmNsdWRlL3VhcGkvbGlu
dXgvcGVyc29uYWxpdHkuaAo+ID4+ID4+PiBAQCAtMjIsNiArMjIsNyBAQCBlbnVtIHsKPiA+PiA+
Pj4gICAgIFdIT0xFX1NFQ09ORFMgPSAgICAgICAgIDB4MjAwMDAwMCwKPiA+PiA+Pj4gICAgIFNU
SUNLWV9USU1FT1VUUyA9ICAgICAgIDB4NDAwMDAwMCwKPiA+PiA+Pj4gICAgIEFERFJfTElNSVRf
M0dCID0gICAgICAgIDB4ODAwMDAwMCwKPiA+PiA+Pj4gKyAgIEFERFJfTElNSVRfNDdCSVQgPSAg
ICAgIDB4MTAwMDAwMDAsCj4gPj4gPj4+ICAgfTsKPiA+PiA+Pgo+ID4+ID4+IEkgd29uZGVyIGlm
IEFERFJfTElNSVRfMTI4VCB3b3VsZCBiZSBjbGVhcmVyPwo+ID4+ID4+Cj4gPj4gPgo+ID4+ID4g
SSBkb24ndCBmb2xsb3csIHdoYXQgZG9lcyAxMjhUIHJlcHJlc2VudD8KPiA+Pgo+ID4+IDEyOFQg
aXMgMTI4IFRlcmFieXRlcywgdGhhdCdzIHRoZSBtYXhpbXVtIHNpemUgYWNoaWV2YWJsZSB3aXRo
IGEgNDdCSVQKPiA+PiBhZGRyZXNzLCB0aGF0IG5hbWluZyB3b3VsZCBiZSBtb3JlIGNvbnNpc3Rh
bnQgd2l0aCB0aGUgQUREUl9MSU1JVF8zR0IKPiA+PiBqdXN0IGFib3ZlIHRoYXQgbWVhbnMgYSAz
IEdpZ2FieXRlcyBsaW1pdC4KPiA+Cj4gPiBIZW5jZSBBRERSX0xJTUlUXzEyOFRCPwo+IAo+IFll
cyBpdCBzaG91bGQgYmUgMTI4VEIuIFR5cG8gYnkgbWUuCj4gCj4gY2hlZXJzCgo0N0JJVCB3YXMg
c2VsZWN0ZWQgYmVjYXVzZSB0aGUgdXNlY2FzZSBmb3IgdGhpcyBmbGFnIGlzIGZvciBhcHBsaWNh
dGlvbnMKdGhhdCB3YW50IHRvIHN0b3JlIGRhdGEgaW4gdGhlIHVwcGVyIGJpdHMgb2YgYSB2aXJ0
dWFsIGFkZHJlc3Mgc3BhY2UuIEluCnRoaXMgY2FzZSwgaG93IGxhcmdlIHRoZSB2aXJ0dWFsIGFk
ZHJlc3Mgc3BhY2UgaXMgaXJyZWxldmFudCwgYW5kIG9ubHkKdGhlIG51bWJlciBvZiBiaXRzIHRo
YXQgYXJlIGJlaW5nIHVzZWQsIGFuZCBoZW5jZSB0aGUgbnVtYmVyIG9mIGJpdHMKdGhhdCBhcmUg
ZnJlZS4KCi0gQ2hhcmxpZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmMK
