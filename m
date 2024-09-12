Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122CBEE57C7
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Sep 2024 06:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0cQTI6G+2GLSxIunkaJxVQCuoXQxBA5PtyINHQOyZz4=; b=MCNiu8lR2v5Tt/
	jmOS9cRu+AU4S9B4FDgOO6khu1LAGZaqu5r8/mmdGxn8JTOCZYwJnsr5hqawJLIovnn0W/pdZ0ZwD
	654IYUn6LEQSTt+7QCkW06J1n7VHY5WVctVh5SQohyQaRuVS4Qg8RHxsQA6jgvq4Fb/a0l3xjEBvI
	W83rcaU44qGwgs56lx8nt1EFOee2sxLJ1BvIOjj0xEVk7mp4an7Pjn/fWnOJ8casldKUu7QzI1Cr0
	E2NsLfOKb2K6OiVVmDwfTYtSO6Qo/hxWom15WHuB54RbSC20th5M3nRt5Ae0rmQlJ18QsJkgeoE0p
	7LYiXF+UfI2SPosCd+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sod9r-0000000C02P-2RjA;
	Thu, 12 Sep 2024 06:18:23 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sod9n-0000000C00M-1Yyj
	for linux-snps-arc@lists.infradead.org;
	Thu, 12 Sep 2024 06:18:21 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-277f35c01f5so284810fac.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Sep 2024 23:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726121898; x=1726726698; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MAcwRzdYBVGpQvvsotib//4T0Ptv25mGEFNsz8/kzr4=;
        b=jJ7rfMSj9LzEuVCXGhLS51z055EWf28SUp2qcX9h3vOaim3LczEIkuVMvk+46wK/++
         14q59+Jcc2EJXg0NKwFbE92byL6ALigcT2GiX5s6Xsl68bl6toBhb6UuQLWVsmcUALCq
         5tc0LSHe8woadoS8KHuWrN8oSMt6MobF6WNqnXZM6O2NrbBm5g+MZ1x3vERp7l8db9+2
         S4W8nRbcYFdZsnxvzsDeT6AlSGsxyZdsOjrOcazfcXTOblDavUxw0rMqNTe5/xs9ZZr8
         M+1Nhj/86TrYa6E+kgjzIylDpfZPbxqO9x3Umj0m2Lo0BpUmeIaGZwTzPAOIYByVqpp1
         xmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726121898; x=1726726698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MAcwRzdYBVGpQvvsotib//4T0Ptv25mGEFNsz8/kzr4=;
        b=oSQ6hupfIXhmcnj05G47t4KenSlade4wgspqVNu8jtX8V+t5QwP3OnL3VxniCsbW2s
         Qp2DJhCgBccsw7Psy8/KtvCG4G2HaoIkIxkd2f9LBHZgYRXdIEkhO53UYHwEJxp6lRIb
         14YUIU6Wkp1zkb/H3zI5nEuXwM8ZbYUw54yqQN9rz3e9q0rVJdAzyJfdC9hSScITZRNN
         XE6Gj2/tcOdSi69uJAxXYKMqT5KmZxTCjUlbnfA1Ty2sMx2tJfCC3Gqvb9vKjLF0MvfW
         nEvsKwTO2aqdHcFvksJTJhsw8M2XcPfnri35v+vO7lrdJ2mqyI6HVn91WKXtUl6expWx
         BBmA==
X-Forwarded-Encrypted: i=1; AJvYcCXsFXK+beVnNbjO+/5oZoNf/uJWpWvcNMWwiKOfFtUXqnZtgC9mgkbEtFEjr+D9RlM7PCEkoRB6zPumc44Ktw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo+3uFqZ4xrR3Jqx70N+sQjLBsdKg502n4U3/YMVxfMXt7LdB8
	N1XM9iSHVG7xGtIicAN9RpKmKeJ6tWG2Z52vQ9o62U1xyEEn/TKjWU/GcwZa5Uo=
X-Google-Smtp-Source: AGHT+IH1u/BITj52DSA2KLJ5czFa7HaODYxdqRl9mmjp1F3evKXCtYQOfdJUyouLtu9doLCVCxJHIA==
X-Received: by 2002:a05:6870:910f:b0:277:eb68:2878 with SMTP id 586e51a60fabf-27c3f6a6e6emr1295326fac.44.1726121898162;
        Wed, 11 Sep 2024 23:18:18 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:7acc:9910:2c1d:4e65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7190f888a78sm3692711b3a.140.2024.09.11.23.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 23:18:17 -0700 (PDT)
Date: Wed, 11 Sep 2024 23:18:12 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuKHpFB+uWuJe2xm@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZuHfp0_tAQhaymdy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_231819_460112_4C6D350A 
X-CRM114-Status: GOOD (  45.00  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMDc6MjE6MjdQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0IDA1OjQ1OjA3UE0gLTA3MDAsIENoYXJs
aWUgSmVua2lucyB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0IDAzOjA4OjE0UE0g
LTA0MDAsIExpYW0gUi4gSG93bGV0dCB3cm90ZToKPiA+ID4gKiBDYXRhbGluIE1hcmluYXMgPGNh
dGFsaW4ubWFyaW5hc0Bhcm0uY29tPiBbMjQwOTA2IDA3OjQ0XToKPiA+ID4gPiBPbiBGcmksIFNl
cCAwNiwgMjAyNCBhdCAwOTo1NTo0MkFNICswMDAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4g
PiA+ID4gT24gRnJpLCBTZXAgNiwgMjAyNCwgYXQgMDk6MTQsIEd1byBSZW4gd3JvdGU6Cj4gPiA+
ID4gPiA+IE9uIEZyaSwgU2VwIDYsIDIwMjQgYXQgMzoxOOKAr1BNIEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+IHdyb3RlOgo+ID4gPiA+ID4gPj4gSXQncyBhbHNvIHVuY2xlYXIgdG8gbWUg
aG93IHdlIHdhbnQgdGhpcyBmbGFnIHRvIGludGVyYWN0IHdpdGgKPiA+ID4gPiA+ID4+IHRoZSBl
eGlzdGluZyBsb2dpYyBpbiBhcmNoX2dldF9tbWFwX2VuZCgpLCB3aGljaCBhdHRlbXB0cyB0bwo+
ID4gPiA+ID4gPj4gbGltaXQgdGhlIGRlZmF1bHQgbWFwcGluZyB0byBhIDQ3LWJpdCBhZGRyZXNz
IHNwYWNlIGFscmVhZHkuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRvIG9wdGltaXplIFJJU0Mt
ViBwcm9ncmVzcywgSSByZWNvbW1lbmQ6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFN0ZXAgMTog
QXBwcm92ZSB0aGUgcGF0Y2guCj4gPiA+ID4gPiA+IFN0ZXAgMjogVXBkYXRlIEdvIGFuZCBPcGVu
SkRLJ3MgUklTQy1WIGJhY2tlbmQgdG8gdXRpbGl6ZSBpdC4KPiA+ID4gPiA+ID4gU3RlcCAzOiBX
YWl0IGFwcHJveGltYXRlbHkgc2V2ZXJhbCBpdGVyYXRpb25zIGZvciBHbyAmIE9wZW5KREsKPiA+
ID4gPiA+ID4gU3RlcCA0OiBSZW1vdmUgdGhlIDQ3LWJpdCBjb25zdHJhaW50IGluIGFyY2hfZ2V0
X21tYXBfZW5kKCkKPiAKPiBQb2ludCA0IGlzIGFuIEFCSSBjaGFuZ2UuIFdoYXQgZ3VhcmFudGVl
cyB0aGF0IHRoZXJlIGlzbid0IHN0aWxsCj4gc29mdHdhcmUgb3V0IHRoZXJlIHRoYXQgcmVsaWVz
IG9uIHRoZSBvbGQgYmVoYXZpb3VyPwoKWWVhaCBJIGRvbid0IHRoaW5rIGl0IHdvdWxkIGJlIGRl
c2lyYWJsZSB0byByZW1vdmUgdGhlIDQ3IGJpdApjb25zdHJhaW50IGluIGFyY2hpdGVjdHVyZXMg
dGhhdCBhbHJlYWR5IGhhdmUgaXQuCgo+IAo+ID4gPiA+ID4gSSByZWFsbHkgd2FudCB0byBmaXJz
dCBzZWUgYSBwbGF1c2libGUgZXhwbGFuYXRpb24gYWJvdXQgd2h5Cj4gPiA+ID4gPiBSSVNDLVYg
Y2FuJ3QganVzdCBpbXBsZW1lbnQgdGhpcyB1c2luZyBhIDQ3LWJpdCBERUZBVUxUX01BUF9XSU5E
T1cKPiA+ID4gPiA+IGxpa2UgYWxsIHRoZSBvdGhlciBtYWpvciBhcmNoaXRlY3R1cmVzICh4ODYs
IGFybTY0LCBwb3dlcnBjNjQpLAo+ID4gPiA+IAo+ID4gPiA+IEZXSVcgYXJtNjQgYWN0dWFsbHkg
bGltaXRzIERFRkFVTFRfTUFQX1dJTkRPVyB0byA0OC1iaXQgaW4gdGhlIGRlZmF1bHQKPiA+ID4g
PiBjb25maWd1cmF0aW9uLiBXZSBlbmQgdXAgd2l0aCBhIDQ3LWJpdCB3aXRoIDE2SyBwYWdlcyBi
dXQgZm9yIGEKPiA+ID4gPiBkaWZmZXJlbnQgcmVhc29uIHRoYXQgaGFzIHRvIGRvIHdpdGggTFBB
MiBzdXBwb3J0IChJIGRvdWJ0IHdlIG5lZWQgdGhpcwo+ID4gPiA+IGZvciB0aGUgdXNlciBtYXBw
aW5nIGJ1dCB3ZSBuZWVkIHRvIHVudGFuZ2xlIHNvbWUgb2YgdGhlIG1hY3JvcyB0aGVyZTsKPiA+
ID4gPiB0aGF0J3MgZm9yIGEgc2VwYXJhdGUgZGlzY3Vzc2lvbikuCj4gPiA+ID4gCj4gPiA+ID4g
VGhhdCBzYWlkLCB3ZSBoYXZlbid0IGVuY291bnRlcmVkIGFueSB1c2VyIHNwYWNlIHByb2JsZW1z
IHdpdGggYSA0OC1iaXQKPiA+ID4gPiBERUZBVUxUX01BUF9XSU5ET1cuIFNvIEkgYWxzbyB0aGlu
ayBSSVNDLVYgc2hvdWxkIGZvbGxvdyBhIHNpbWlsYXIKPiA+ID4gPiBhcHByb2FjaCAoNDcgb3Ig
NDggYml0IGRlZmF1bHQgbGltaXQpLiBCZXR0ZXIgdG8gaGF2ZSBzb21lIEFCSQo+ID4gPiA+IGNv
bnNpc3RlbmN5IGJldHdlZW4gYXJjaGl0ZWN0dXJlcy4gT25lIGNhbiBzdGlsbCBhc2sgZm9yIGFk
ZHJlc3NlcyBhYm92ZQo+ID4gPiA+IHRoaXMgZGVmYXVsdCBsaW1pdCB2aWEgbW1hcCgpLgo+ID4g
PiAKPiA+ID4gSSB0aGluayB0aGF0IGlzIGJlc3QgYXMgd2VsbC4KPiA+ID4gCj4gPiA+IENhbiB3
ZSBwbGVhc2UganVzdCBkbyB3aGF0IHg4NiBhbmQgYXJtNjQgZG9lcz8KPiA+IAo+ID4gSSByZXNw
b25kZWQgdG8gQXJuZCBpbiB0aGUgb3RoZXIgdGhyZWFkLCBidXQgSSBhbSBzdGlsbCBub3QgY29u
dmluY2VkCj4gPiB0aGF0IHRoZSBzb2x1dGlvbiB0aGF0IHg4NiBhbmQgYXJtNjQgaGF2ZSBzZWxl
Y3RlZCBpcyB0aGUgYmVzdCBzb2x1dGlvbi4KPiA+IFRoZSBzb2x1dGlvbiBvZiBkZWZhdWx0aW5n
IHRvIDQ3IGJpdHMgZG9lcyBhbGxvdyBhcHBsaWNhdGlvbnMgdGhlCj4gPiBhYmlsaXR5IHRvIGdl
dCBhZGRyZXNzZXMgdGhhdCBhcmUgYmVsb3cgNDcgYml0cy4gSG93ZXZlciwgZHVlIHRvCj4gPiBk
aWZmZXJlbmNlcyBhY3Jvc3MgYXJjaGl0ZWN0dXJlcyBpdCBkb2Vzbid0IHNlZW0gcG9zc2libGUg
dG8gaGF2ZSBhbGwKPiA+IGFyY2hpdGVjdHVyZXMgZGVmYXVsdCB0byB0aGUgc2FtZSB2YWx1ZS4g
QWRkaXRpb25hbGx5LCB0aGlzIGZsYWcgd2lsbCBiZQo+ID4gYWJsZSB0byBoZWxwIHVzZXJzIGF2
b2lkIHBvdGVudGlhbCBidWdzIHdoZXJlIGEgaGludCBhZGRyZXNzIGlzIHBhc3NlZAo+ID4gdGhh
dCBjYXVzZXMgdXBwZXIgYml0cyBvZiBhIFZBIHRvIGJlIHVzZWQuCj4gCj4gVGhlIHJlYXNvbiB3
ZSBhZGRlZCB0aGlzIGxpbWl0IG9uIGFybTY0IGlzIHRoYXQgd2Ugbm90aWNlZCBwcm9ncmFtcwo+
IHVzaW5nIHRoZSB0b3AgOCBiaXRzIG9mIGEgNjQtYml0IHBvaW50ZXIgZm9yIGFkZGl0aW9uYWwg
aW5mb3JtYXRpb24uCj4gSUlSQywgaXQgd2Fzbid0IGV2ZW4gb3BlbkpESyBidXQgc29tZSBKYXZh
U2NyaXB0IEpJVC4gV2UgY291bGQgaGF2ZQo+IHRhdWdodCB0aG9zZSBwcm9ncmFtcyBvZiBhIG5l
dyBmbGFnIGJ1dCBzaW5jZSB3ZSBjb3VsZG4ndCB0ZWxsIGhvdyBtYW55Cj4gYXJlIG91dCB0aGVy
ZSwgaXQgd2FzIHRoZSBzYWZlc3QgdG8gZGVmYXVsdCB0byBhIHNtYWxsZXIgbGltaXQgYW5kIG9w
dAo+IGluIHRvIHRoZSBoaWdoZXIgb25lLiBTdWNoIG9wdC1pbiBpcyB2aWEgbW1hcCgpIGJ1dCBp
ZiB5b3UgcHJlZmVyIGEKPiBwcmN0bCgpIGZsYWcsIHRoYXQncyBmaW5lIGJ5IG1lIGFzIHdlbGwg
KHRob3VnaCBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlCj4gb3B0LWluIHRvIGhpZ2hlciBhZGRyZXNz
ZXMgcmF0aGVyIHRoYW4gb3B0LW91dCBvZiB0aGUgaGlnaGVyIGFkZHJlc3NlcykuCgpUaGUgbW1h
cCgpIGZsYWcgd2FzIHVzZWQgaW4gcHJldmlvdXMgdmVyc2lvbnMgYnV0IHdhcyBkZWNpZGVkIGFn
YWluc3QKYmVjYXVzZSB0aGlzIGZlYXR1cmUgaXMgbW9yZSB1c2VmdWwgaWYgaXQgaXMgcHJvY2Vz
cy13aWRlLiBBCnBlcnNvbmFsaXR5KCkgZmxhZyB3YXMgY2hvc2VuIGluc3RlYWQgb2YgYSBwcmN0
bCgpIGZsYWcgYmVjYXVzZSB0aGVyZQpleGlzdGVkIG90aGVyIGZsYWdzIGluIHBlcnNvbmFsaXR5
KCkgdGhhdCB3ZXJlIHNpbWlsYXIuIEkgYW0gdGVtcHRlZCB0bwp1c2UgcHJjdGwoKSBob3dldmVy
IGJlY2F1c2UgdGhlbiB3ZSBjb3VsZCBoYXZlIGFuIGFkZGl0aW9uYWwgYXJnIHRvCnNlbGVjdCB0
aGUgZXhhY3QgbnVtYmVyIG9mIGJpdHMgdGhhdCBzaG91bGQgYmUgcmVzZXJ2ZWQgKHJhdGhlciB0
aGFuCmJlaW5nIGZpeGVkIGF0IDQ3IGJpdHMpLgoKT3B0aW5nLWluIHRvIHRoZSBoaWdoZXIgYWRk
cmVzcyBzcGFjZSBpcyByZWFzb25hYmxlLiBIb3dldmVyLCBpdCBpcyBub3QKbXkgcHJlZmVyZW5j
ZSwgYmVjYXVzZSB0aGUgcHVycG9zZSBvZiB0aGlzIGZsYWcgaXMgdG8gZW5zdXJlIHRoYXQKYWxs
b2NhdGlvbnMgZG8gbm90IGV4Y2VlZCA0Ny1iaXRzLCBzbyBpdCBpcyBhIGNsZWFyZXIgQUJJIHRv
IGhhdmUgdGhlCmFwcGxpY2F0aW9ucyB0aGF0IHdhbnQgdGhpcyBndWFyYW50ZWUgdG8gYmUgdGhl
IG9uZXMgc2V0dGluZyB0aGUgZmxhZywKcmF0aGVyIHRoYW4gdGhlIGFwcGxpY2F0aW9ucyB0aGF0
IHdhbnQgdGhlIGhpZ2hlciBiaXRzIHNldHRpbmcgdGhlIGZsYWcuCgotIENoYXJsaWUKCj4gCj4g
LS0gCj4gQ2F0YWxpbgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1zbnBzLWFyYwo=
