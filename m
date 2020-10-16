Return-Path: <SRS0=Aepa=DX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEBAC4363D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 15:44:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E0A20848
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Oct 2020 15:44:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C87/LMmE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0E0A20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9TeH13StmnAo6MebRCs9Zgjmt8YcB0yS2ZkCWnlY6Wg=; b=C87/LMmEIwZyugN3EKS5cvAwV
	Pe9AXL3SzjaN92r8n3ajlzSiuD6Duo0+M0eaSdTqzvk0Q5sGWILm/HJGCznOEe8rVouFsppGMTYvL
	ayEhk6PGKzeG/kgHuAVT08dXqqy4NXhQNd8TrkvtnG1jCp/q1M6V8cb+cid/n1U0YjblVDCEHtaCE
	4WTEbWgv71A5Czc7udt7m3QVq5+oWd/x6z2Z+UTKv0xs4I3qMBsnp1KqWYHKe/keSoqfstc1xUIx0
	jTKEE+ahr9NqNe+7syzO/WVkU+6Ev0bKW/WIJ2g3I3t/E/uJXmxBNaLzNBkV3+v486TAoU6eT6FD7
	GdjOUr/KQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTRtv-0001Fp-VN; Fri, 16 Oct 2020 15:44:16 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTRtr-0001E4-M9; Fri, 16 Oct 2020 15:44:12 +0000
Received: by mail-ot1-f68.google.com with SMTP id m11so2755670otk.13;
 Fri, 16 Oct 2020 08:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y6uUrO47xJuekVbKZFp61eOF00usAMuQ8nla70UX51Q=;
 b=gXtiBjP+mMISxaT0DaQcBaHKD0KZryoyosQDYQsCQiw03zK/kkQBdEh4gdbKrXiQFr
 phIw9X8ZQny5ImjMX2H8ZvCQJfsyln1k80mVMPwDgWyleaN0xRB7eue6Bnav8cMvYfDu
 PWwiN2KYxhwAnwKc0fEVqxFjS3mDMW6zZgMIefH3SlD4c8UvjJ1XFTHe+k24oGw+8pEB
 Le3YK19Hsfooddw5pJzaTly0vvXcyr8F8gRQOHUjJ5SD3CWOLqt7Gsoz3JBe6u4ITs48
 BuegS8McJYvzvlcPseBzGYDmWwvYOSV1g7GBWRiUx9wXa0HxRpGpAOgi9hf/fjtPv+PQ
 8P8Q==
X-Gm-Message-State: AOAM532L9Go02Fh4AuzTCktxhslzbPCGE8E5C2xurwhUShuqvzyCJ0Sk
 lAH2x2oWVVqQMTcGgGvIAQ==
X-Google-Smtp-Source: ABdhPJzyKW8ZO4qbCpHyH61FZ7oq0uCuGGIquis4K3Bt8t41p/hh05+oeioUYSSIX2RPEiqRi1znjQ==
X-Received: by 2002:a9d:7387:: with SMTP id j7mr3154048otk.18.1602863048717;
 Fri, 16 Oct 2020 08:44:08 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n23sm1257578oon.14.2020.10.16.08.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 08:44:08 -0700 (PDT)
Received: (nullmailer pid 1466778 invoked by uid 1000);
 Fri, 16 Oct 2020 15:44:06 -0000
Date: Fri, 16 Oct 2020 10:44:06 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 04/20] dt-bindings: usb: usb-hcd: Add "tpl-support"
 property
Message-ID: <20201016154406.GA1452617@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
 <20201014132756.GA1538723@bogus>
 <20201014172710.iay3lvb37saeksaj@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014172710.iay3lvb37saeksaj@mobilestation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_114411_758333_CCE03892 
X-CRM114-Status: GOOD (  23.36  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Mathias Nyman <mathias.nyman@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Felipe Balbi <balbi@kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 08:27:10PM +0300, Serge Semin wrote:
> On Wed, Oct 14, 2020 at 08:27:56AM -0500, Rob Herring wrote:
> > On Wed, 14 Oct 2020 13:13:46 +0300, Serge Semin wrote:
> > > The host controller device might be designed to work for the particular
> > > products or applications. In that case its DT node is supposed to be
> > > equipped with the tpl-support property.
> > > 
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > 
> > > ---
> > > 
> > > Changelog v2:
> > > - Grammar fix: "s/it'/its"
> > > - Discard '|' from the property description, since we don't need to preserve
> > >   the text formatting.
> > > ---
> > >  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > Traceback (most recent call last):
> >   File "/usr/local/bin/dt-extract-example", line 45, in <module>
> >     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
> >   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
> >     return constructor.get_single_data()
> >   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
> >     node = self.composer.get_single_node()
> >   File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
> >   File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
> >   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
> >   File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
> >   File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
> > ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
> >   in "<unicode string>", line 27, column 14
> > make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/usb-hcd.example.dts] Error 1
> > make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/usb-hcd.example.dts'
> > make[1]: *** Waiting for unfinished jobs....
> > ./Documentation/devicetree/bindings/usb/usb-hcd.yaml:27:14: [error] syntax error: mapping values are not allowed here (syntax)
> > make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
> > make: *** [Makefile:1366: dt_binding_check] Error 2
> > 
> > 
> > See https://patchwork.ozlabs.org/patch/1382001
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure dt-schema is up to date:
> > 
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> > 
> > Please check and re-submit.
> 
> Hm, that's weird. Of course I did the dt_binding_check before submission, but
> even after the dt-schema repo update I failed to see the error:
> 
> $ make -j8 ARCH=mips CROSS_COMPILE=mipsel-baikal-linux- dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/usb-hcd.yaml
>   CHKDT   Documentation/devicetree/bindings/usb/usb-hcd.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
>   DTC     Documentation/devicetree/bindings/usb/usb-hcd.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/usb/usb-hcd.example.dt.yaml
> 
> Rob, any idea why has the bot got mad at me?

Humm, I'm not sure. We'll see if it happens again when you send v2.

Note that yamllint is also run now and that's the line with '[error]'. 
So neither yamllint nor ruamel are happy (could be the same parser code 
ultimately).

Rob

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
