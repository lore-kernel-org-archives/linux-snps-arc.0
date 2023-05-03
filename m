Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A64C77B78
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 May 2023 08:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShjjEQh3LuJlssOAqgrMI+WlOrUMDi9KnNrO835RzRQ=; b=BEsHt/1/6ZUG7O
	S3SWv/XHGsIskI5WI5BNIRn/2+9cDHfZ5AfErVOg3idjPxnJid3tyVP3RvIwuqF+uVhqi7+1Y2pTr
	F/MLdf2Jp8cKGQcebyj56PzAoMrBJMzuz1Gi33U5GVCM86WxlKNvXvJDbJdFvLF1c31TLLDaFP1Ii
	hyaPiymUyKmuMKu/My56MTOTaDAgM9D3A7GXmNalzWPXu7SybVzoXq0rH5kNIY9/BKZzkoI1b5OYa
	/g+EOLy4GTcfHmrGtF6n6maljJj6LbjCeOjV8qL49D4T6XlksoJAnlgQPf5sLb0O6mI41AAGsJ1uN
	SpoLDW/GXSx0hV+rS+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu7Yj-003mRu-11;
	Wed, 03 May 2023 08:09:57 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu7Yg-003mPu-0L;
	Wed, 03 May 2023 08:09:55 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-559e317eef1so59867057b3.0;
        Wed, 03 May 2023 01:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683101391; x=1685693391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SVmNF978sXXspcYjjZLpiBDqyot8IfsoBtpE1ZoRNc=;
        b=gQYNGpo/CstaqNyYjPd5gxdeZjPLS32MbHOtY2/9r/xNueN/tKFPmqUz+lz9KAGbsy
         Knr2Rhr2Dnjwf2cnzlXqAGZsEFXctb7YsulXEnE0woL+5oHf3oYLNlVkf7Wx5gyN8zHz
         DZQoSrXKIzFJS9EGq6IpXnLvAmbdF8aOgChG9tFHf/W2bVxgq1VRmu1kWJF25vzLJW5E
         NsGx1zC+eMXGSS2wykFBAblfd42EobmCZpgrMfiJkfweSws7jhcmqYvhnGEJglXlwQJi
         9Rd1wWpvVOrsj5JrD8eQNvMXe1MVhsjPsz3a1jio6Qujsmw2ylR2gnvPVkwgrKTTqLVw
         8QPw==
X-Gm-Message-State: AC+VfDyqDMKBRBrnCGdjdIOCRrH9MToZJ+gctotoJmYY+qu/0r8LF204
	exfK8/YHnrDy8LnxGkG6mTBcvd/nuvfv5g==
X-Google-Smtp-Source: ACHHUZ55lYtNBwQXHMH2sEnbP/mMibFI6jsFxtCyBYYQ/2lPTICd7lPUXgQjgUYB8L6FSQIzcxghDg==
X-Received: by 2002:a0d:d597:0:b0:55b:4942:c86b with SMTP id x145-20020a0dd597000000b0055b4942c86bmr2111417ywd.42.1683101391348;
        Wed, 03 May 2023 01:09:51 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id q128-20020a0dce86000000b00559d1eabc3csm10830ywd.79.2023.05.03.01.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:09:51 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-559ded5e170so61273387b3.3;
        Wed, 03 May 2023 01:09:50 -0700 (PDT)
X-Received: by 2002:a0d:c347:0:b0:556:dd1b:3bb7 with SMTP id
 f68-20020a0dc347000000b00556dd1b3bb7mr19301020ywd.43.1683101390642; Wed, 03
 May 2023 01:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230502130223.14719-1-tzimmermann@suse.de> <20230502130223.14719-5-tzimmermann@suse.de>
 <20230502195429.GA319489@ravnborg.org> <563673c0-799d-e353-974c-91b1ab881a22@suse.de>
 <87354dyj9i.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87354dyj9i.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 10:09:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8Sm7sBu47XQ1xygn6fzq2FzQeiuK0ncMVGHan-_k4Ow@mail.gmail.com>
Message-ID: <CAMuHMdW8Sm7sBu47XQ1xygn6fzq2FzQeiuK0ncMVGHan-_k4Ow@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] fbdev: Include <linux/io.h> via <asm/fb.h>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, linux-arch@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, arnd@arndb.de, deller@gmx.de, 
	chenhuacai@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com, 
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, 
	vgupta@kernel.org, sparclinux@vger.kernel.org, kernel@xen0n.name, 
	linux-snps-arc@lists.infradead.org, davem@davemloft.net, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_010954_143034_4B6F1674 
X-CRM114-Status: GOOD (  27.13  )
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

T24gV2VkLCBNYXkgMywgMjAyMyBhdCA5OjE54oCvQU0gSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
CjxqYXZpZXJtQHJlZGhhdC5jb20+IHdyb3RlOgo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cml0ZXM6Cj4gPiBBbSAwMi4wNS4yMyB1bSAyMTo1NCBzY2hyaWViIFNh
bSBSYXZuYm9yZzoKPiA+PiBPbiBUdWUsIE1heSAwMiwgMjAyMyBhdCAwMzowMjoyMVBNICswMjAw
LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPgo+IFsuLi5dCj4KPiA+Pj4gICAjaW5jbHVkZSA8
bGludXgvY29uc29sZS5oPiAvKiBXaHkgc2hvdWxkIGZiIGRyaXZlciBjYWxsIGNvbnNvbGUgZnVu
Y3Rpb25zPyBiZWNhdXNlIGNvbnNvbGVfbG9jaygpICovCj4gPj4+ICAgI2luY2x1ZGUgPHZpZGVv
L3ZnYS5oPgo+ID4+Pgo+ID4+PiArI2luY2x1ZGUgPGFzbS9mYi5oPgo+ID4+Cj4gPj4gV2hlbiB3
ZSBoYXZlIGEgaGVhZGVyIGxpa2UgbGludXgvZmIuaCAtIGl0IGlzIG15IHVuZGVyc3RhbmRpbmcg
dGhhdCBpdCBpcwo+ID4+IHByZWZlcnJlZCB0byBpbmNsdWRlIHRoYXQgZmlsZSwgYW5kIG5vdCB0
aGUgYXNtL2ZiLmggdmFyaWFudC4KPiA+Pgo+ID4+IFRoaXMgaXMgYXNzdW1pbmcgdGhlIGxpbnV4
L2ZiLmggY29udGFpbnMgdGhlIGdlbmVyaWMgc3R1ZmYsIGFuZCBpbmNsdWRlcwo+ID4+IGFzbS9m
Yi5oIGZvciB0aGUgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIHBhcnRzLgo+ID4+Cj4gPj4gU28gZHJp
dmVycyB3aWxsIGluY2x1ZGUgbGludXgvZmIuaCBhbmQgdGhlbiB0aGV5IGF1dG9tYXRpY2FsbHkg
Z2V0IHRoZQo+ID4+IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBwYXJ0cyBmcm9tIGFzbS9mYi5oLgo+
ID4+Cj4gPj4gSW4gb3RoZXIgd29yZHMsIGRyaXZlcnMgYXJlIG5vdCBzdXBwb3NlZCB0byBpbmNs
dWRlIGFzbS9mYi5oLCBpZgo+ID4+IGxpbnV4LmZiLmggZXhpc3RzIC0gYW5kIGxpbnV4L2ZiLmgg
c2hhbGwgaW5jbHVkZSB0aGUgYXNtL2ZiLmguCj4gPj4KPiA+PiBJZiB0aGUgYWJvdmUgaG9sZHMg
dHJ1ZSwgdGhlbiBpdCBpcyB3cm9uZyBhbmQgbm90IG5lZWRlZCB0byBhZGQgYXNtL2ZiLmgKPiA+
PiBhcyBzZWVuIGFib3ZlLgo+ID4+Cj4gPj4KPiA+PiBUaGVyZSBhcmUgY291bnRsZXNzIGV4YW1w
bGVzIHdoZXJlIHRoZSBhYm92ZSBhcmUgbm90IGZvbGxvd2VkLAo+ID4+IGJ1dCB0byBteSBiZXN0
IHVuZGVyc3RhbmRpbmcgdGhlIGFib3ZlIGl0IHRoZSBwcmVmZXJyZWQgd2F5IHRvIGRvIGl0Lgo+
ID4KPiA+IFdoZXJlIGRpZCB5b3VoZXIgdGhpcz8gSSBvbmx5IGtub3cgYWJvdXQgdGhpcyBpbiB0
aGUgY2FzZSBvZiBhc20vaW8uaAo+ID4gdnMuIGxpbnV4L2lvLmguCj4gPgo+Cj4gSSB1bmRlcnN0
YW5kIHRoYXQncyB0aGUgY2FzZSB0b28uIEkgYmVsaWV2ZSBldmVuIGNoZWNrcGF0Y2gucGwgY29t
cGxhaW5zCj4gYWJvdXQgaXQ/IChub3QgdGhhdCB0aGUgc2NyaXB0IGFsd2F5cyBnZXQgcmlnaHQs
IGJ1dCBqdXN0IGFzIGFuIGV4YW1wbGUpLgoKT25lIG1vcmUgdG8gY2hpbWUgaW46IGluIGdlbmVy
YWwsIGRyaXZlcnMgc2hvdWxkIG9ubHkgaW5jbHVkZSA8bGludXgvZm9vLmg+LgpJbmNsdWRpbmcg
PGFzbS9mb28uaD4gZGlyZWN0bHkgaXMgdGhlIGV4Y2VwdGlvbi4KCkdye29ldGplLGVldGluZ31z
LAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMg
SSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
