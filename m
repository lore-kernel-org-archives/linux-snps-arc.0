Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C996AC7619A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Apr 2023 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3dDFv6n21m68FH+VkXSZDp1otflPA7VB1+7BlIXAkc=; b=DCFWOSww5p+VJC
	j23VYrgEnaWdEPdqGwe/0sIK+6RpkETcjHAn8IjiipaKVe5bzryZX0tBh8tJRymWlFWjob/H6Vp2u
	mRbpQYX+SSJfkayaee57B/7mvhrCi0mxYMyPglNGZYlaee9ZX7O4jpr4RqFSj5NkdRQVE5mwfu7gC
	byHT7FQN5GRne7cL6mTTH6fE6Xi0RphjWcixmKNKYN4TVIj8zSTjySdM8iHpCcvWeuVTnb+54BSLD
	UgkS/+nZO48Ikxn56oBKdYspTVas52J1DZko5YqSwo+QOVny/x+aNdy0CHZuPnT65P8Q1zAv8FogM
	0o+sDUtHSnk8ykZwFmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Es-00GpCz-34;
	Tue, 11 Apr 2023 08:20:30 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Eo-00Gp67-1L;
	Tue, 11 Apr 2023 08:20:28 +0000
Received: by mail-yb1-f182.google.com with SMTP id 72so7293248ybe.6;
        Tue, 11 Apr 2023 01:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOXdqLxEHLBZ7hy/2mM/9REbA1X5ZreSZtF+7etv6Sw=;
        b=SWOROTS9Y8cYMHof8VhPdh7XwQq7taM8lDiGwztlapSIn/DBCLyDGyHWYGVLb3MvGN
         FfoQ1xFF1I0AtUePpn0GIjWpVvBzdQizPzBK9db4AMC82VgeCQ6o1EJtoXlFd/7eynJM
         NkEnsPQl07tFy+7X+9hOuCqOxOa7JugLeSWcLA+UWrl+A+O8GTXswgT52QtZgPiCBpln
         KVDG5idQy0J1aNXamsDjxBE0QREi9ijDyZHW3figV9PBPoY5zHcBLt1kQBr/4ROSBMCb
         Ajkba2RiH6474wpnNn5ODz3OageJovMMnO/Esp7PfWPjrnh3CnMsOW8PXACVr3hZRefz
         fqDg==
X-Gm-Message-State: AAQBX9ffjYsMcPkSxz6Ly1fWjOgF6iHb9uJEyIz1YF78ABP02TZ0i/6F
	G7vO1Wo0Vibk19XoDTOefex3Y3E/vebWUw==
X-Google-Smtp-Source: AKy350bQxn1epK/mlYXd1sJVPHN1M/v1mjdLx4uH0FbO7HTbunDWUlj0lqij+1+XbImmF/04656b8w==
X-Received: by 2002:a25:424a:0:b0:b8b:ec36:1bf2 with SMTP id p71-20020a25424a000000b00b8bec361bf2mr1194311yba.60.1681201215226;
        Tue, 11 Apr 2023 01:20:15 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id h185-20020a25d0c2000000b00b7767ca746asm3532488ybg.7.2023.04.11.01.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:20:13 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id v7so5702702ybi.0;
        Tue, 11 Apr 2023 01:20:13 -0700 (PDT)
X-Received: by 2002:a25:d447:0:b0:b75:9519:dbcd with SMTP id
 m68-20020a25d447000000b00b759519dbcdmr960089ybf.12.1681201212819; Tue, 11 Apr
 2023 01:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-9-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-9-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:20:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmZ2GRKqEnZgQKzJ1-Hy-Cz8yoUOhD0TMMqZriH82-tQ@mail.gmail.com>
Message-ID: <CAMuHMdVmZ2GRKqEnZgQKzJ1-Hy-Cz8yoUOhD0TMMqZriH82-tQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] arch/m68k: Implement <asm/fb.h> with generic helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com, 
	gregkh@linuxfoundation.org, linux-arch@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012026_452776_CACDEA99 
X-CRM114-Status: GOOD (  13.66  )
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

T24gVGh1LCBBcHIgNiwgMjAyMyBhdCA0OjMw4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+IFJlcGxhY2UgdGhlIGFyY2hpdGVjdHVyZSdzIGZiX2lz
X3ByaW1hcnlfZGV2aWNlKCkgd2l0aCB0aGUgZ2VuZXJpYwo+IG9uZSBmcm9tIDxhc20tZ2VuZXJp
Yy9mYi5oPi4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgo+Cj4gdjI6Cj4gICAgICAgICAqIHByb3Zp
ZGUgZW1wdHkgZmJfcGdwcm90ZWN0KCkgb24gbm9uLU1NVSBzeXN0ZW1zCj4KPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KCkFja2VkLWJ5OiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4g
cGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNl
bGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51
eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
