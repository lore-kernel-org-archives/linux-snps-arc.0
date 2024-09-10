Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281E9ECE564
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Sep 2024 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eu3r+277qkrkmxTZHSoF+K7TPkjIsnvbrTtPNMLNEAk=; b=AO+dcbWYivNjlR
	y5GMqK335mYApsx7mjoBjSquyu+WPx7ARFJByXA/M4incUXmtmhhkfrcD6vvE9VHK5L/4+AcSmq43
	XeP4VWEO9rSIK/lX3l7CbM9fXOf6G//gFLt9QDHFnNfvCgnoVTUnhzUhkyVqJGvFTbxJJWQwRS38D
	tHDBzYc7bTsPI+r26Pgac2GQb/K0J666AtbiEuNrbphsOrmjbP4RRSFyztD2CPtO4GeRoS6XozJT1
	ebDwo1XXgFNE1qRj9S3oXvLY9PEkqLbf6Qezfs1pYOnE5sNOlUrxytTEAgJeynMNlmoNbeV2EQmqN
	an9Ioky8OsJeCU4FrGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0Ji-00000005bwG-37GC;
	Tue, 10 Sep 2024 12:49:58 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so0Iz-00000005bp4-15Uo;
	Tue, 10 Sep 2024 12:49:14 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-277c28fac92so5196442fac.3;
        Tue, 10 Sep 2024 05:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972551; x=1726577351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FY/G3MXaavbXgZQIcVqEM6/ihxl9V6XepDsCDLrUSCE=;
        b=M6Sqsx/6DJF9IcPns3dU1uWs855sVPHaYJgXARSh75mWTyc6HQS3r3+XW+sSsfGXts
         0YvbutJpfZNGzH+EQ3OT37yXRu3X+DQmvt1oTzmAM4VlakV4wcnWg3GQQoDMlc2vlvS1
         zqk9g2yQY4Dd0yWRk2bxtP2YCvEHfQvWF1tJhH0NqryDQpOj8CjxtZWQUdLYT4FxLSpc
         hEIocv+U45byUReYh6iN5BleckILzLqo3j7DrYWcucLcAV7Pn+KsJ07hpiw0JPNF1Kdd
         +S2hfXwgEnOgqUSMBa1MnmKz5HxFAB0XKqXxB6BbxUIecMkzkNxXnLxyhJDRLlr0kyjh
         uGdw==
X-Forwarded-Encrypted: i=1; AJvYcCVrTZ93MstLEfc+jGTL8aNgNoQOfMbYO2/BYs5izMKuwpmm+ql8eNFT2p02842mLIPITePoGktvzxED8AB9S64=@lists.infradead.org, AJvYcCXJy55E8UYcgE8StyAob6AANqOIY4ACSJkjSqCMSuk/XFBmJATLs2cdDvVUgpAAVTRyI1z05AORZo2ha3QyEQHy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6I+/750nOkl0sVy7iHqjBq20FiT+FZSYNl32fvG+0Y6C06ieJ
	ZWFHhx5K1ANFYA19K5D7hu2ZMKBDCssrmPHZTaI2XGqqOStzVAUFG5MlHuQQ
X-Google-Smtp-Source: AGHT+IF341i1xPqEKVi56DGy5KwCs0fjyb71h6URIa9Aph0IO43uCxtfMNoEcVK5Qg1wRePaDs3oMA==
X-Received: by 2002:a05:6871:153:b0:278:aa3:1d0f with SMTP id 586e51a60fabf-27b82fab32bmr15526866fac.34.1725972551395;
        Tue, 10 Sep 2024 05:49:11 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-27ba3e49e0dsm2030825fac.6.2024.09.10.05.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 05:49:11 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3df02c407c4so3244133b6e.1;
        Tue, 10 Sep 2024 05:49:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWo265cUnI5XTa02p9zQmErPncmgPp55bnuEz88g3zOIPdkGWsfYaECMgNXB6gcXXgr9ZzfbpPLwCeGse2SbV4=@lists.infradead.org, AJvYcCXyngwb6RdfJo1KP2msPBP91CKem9u5Ck7qE1M4N/dgE/VDq8bdhyZ227x7Pxj2uL5j767b6Zj9Drre8keAD15K@lists.infradead.org
X-Received: by 2002:a05:690c:39d:b0:6c8:1e30:513f with SMTP id
 00721157ae682-6db44f37140mr169442817b3.23.1725972199364; Tue, 10 Sep 2024
 05:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse> <Zt9HboH/PmPlRPmH@ghost> <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
In-Reply-To: <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Sep 2024 14:43:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
Message-ID: <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek <chris.torek@gmail.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_054913_317533_6D048862 
X-CRM114-Status: GOOD (  21.44  )
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

SGkgQ2hyaXN0b3BoZSwKCk9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0IDExOjIx4oCvQU0gQ2hyaXN0
b3BoZSBMZXJveQo8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToKPiA+Pj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9wZXJzb25hbGl0eS5oIGIvaW5jbHVkZS91YXBp
L2xpbnV4L3BlcnNvbmFsaXR5LmgKPiA+Pj4gaW5kZXggNDk3OTZiNzc1NmFmLi5jZDNiOGMxNTRk
OWIgMTAwNjQ0Cj4gPj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9wZXJzb25hbGl0eS5oCj4g
Pj4+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9wZXJzb25hbGl0eS5oCj4gPj4+IEBAIC0yMiw2
ICsyMiw3IEBAIGVudW0gewo+ID4+PiAgICAgV0hPTEVfU0VDT05EUyA9ICAgICAgICAgMHgyMDAw
MDAwLAo+ID4+PiAgICAgU1RJQ0tZX1RJTUVPVVRTID0gICAgICAgMHg0MDAwMDAwLAo+ID4+PiAg
ICAgQUREUl9MSU1JVF8zR0IgPSAgICAgICAgMHg4MDAwMDAwLAo+ID4+PiArICAgQUREUl9MSU1J
VF80N0JJVCA9ICAgICAgMHgxMDAwMDAwMCwKPiA+Pj4gICB9Owo+ID4+Cj4gPj4gSSB3b25kZXIg
aWYgQUREUl9MSU1JVF8xMjhUIHdvdWxkIGJlIGNsZWFyZXI/Cj4gPj4KPiA+Cj4gPiBJIGRvbid0
IGZvbGxvdywgd2hhdCBkb2VzIDEyOFQgcmVwcmVzZW50Pwo+Cj4gMTI4VCBpcyAxMjggVGVyYWJ5
dGVzLCB0aGF0J3MgdGhlIG1heGltdW0gc2l6ZSBhY2hpZXZhYmxlIHdpdGggYSA0N0JJVAo+IGFk
ZHJlc3MsIHRoYXQgbmFtaW5nIHdvdWxkIGJlIG1vcmUgY29uc2lzdGFudCB3aXRoIHRoZSBBRERS
X0xJTUlUXzNHQgo+IGp1c3QgYWJvdmUgdGhhdCBtZWFucyBhIDMgR2lnYWJ5dGVzIGxpbWl0LgoK
SGVuY2UgQUREUl9MSU1JVF8xMjhUQj8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
