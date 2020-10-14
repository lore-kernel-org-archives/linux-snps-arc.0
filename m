Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F620C43457
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 17:27:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B57B22227
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 17:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="axPAW6lP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B57B22227
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VwII8j7wSu/+k6mWM15iYoSk48xgemKlU6jan7VcNfc=; b=axPAW6lPL6MrU6TF1uEJHKba8
	fdAk7rA7oLyeEp8p0gEnfNL+yVWcW7iTLimRm75Vq8jTD0/9qnhdw9WADF81Lr1lqo6msbIew1LGJ
	817vIgNTjcy34VNT6exo4JKKtK6hSazzXzd0zo7m+U1TITsoGetutrQD+CpS166qXA9kFBHfabSSu
	SSgzqvjbOHRIXwBVu9AZk3sGen5SaoGBCrlYjiAl6+Jeaxl6+B80MKR4A29wfEL6tNH0nWCV9ce8b
	Ha3Xt4ZDpQ60OTZQma3hALqiPgYv5S3OMTTGjqKFdrbT+l6g6BTxABc1W5MKRhK3z33a1sWC0yT+k
	rC80PU2xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSkYY-0006jh-Cm; Wed, 14 Oct 2020 17:27:18 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSkYU-0006j1-Le; Wed, 14 Oct 2020 17:27:15 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 68971803017E;
 Wed, 14 Oct 2020 17:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkbvMsci3JDb; Wed, 14 Oct 2020 20:27:12 +0300 (MSK)
Date: Wed, 14 Oct 2020 20:27:10 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/20] dt-bindings: usb: usb-hcd: Add "tpl-support"
 property
Message-ID: <20201014172710.iay3lvb37saeksaj@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
 <20201014132756.GA1538723@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014132756.GA1538723@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_132714_986038_CA60EB16 
X-CRM114-Status: GOOD (  16.73  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 08:27:56AM -0500, Rob Herring wrote:
> On Wed, 14 Oct 2020 13:13:46 +0300, Serge Semin wrote:
> > The host controller device might be designed to work for the particular
> > products or applications. In that case its DT node is supposed to be
> > equipped with the tpl-support property.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v2:
> > - Grammar fix: "s/it'/its"
> > - Discard '|' from the property description, since we don't need to preserve
> >   the text formatting.
> > ---
> >  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-extract-example", line 45, in <module>
>     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
>     return constructor.get_single_data()
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
>     node = self.composer.get_single_node()
>   File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
>   File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
>   File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>   File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
>   File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
> ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
>   in "<unicode string>", line 27, column 14
> make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/usb-hcd.example.dts] Error 1
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/usb-hcd.example.dts'
> make[1]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/usb/usb-hcd.yaml:27:14: [error] syntax error: mapping values are not allowed here (syntax)
> make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
> make: *** [Makefile:1366: dt_binding_check] Error 2
> 
> 
> See https://patchwork.ozlabs.org/patch/1382001
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.

Hm, that's weird. Of course I did the dt_binding_check before submission, but
even after the dt-schema repo update I failed to see the error:

$ make -j8 ARCH=mips CROSS_COMPILE=mipsel-baikal-linux- dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/usb-hcd.yaml
  CHKDT   Documentation/devicetree/bindings/usb/usb-hcd.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
  DTC     Documentation/devicetree/bindings/usb/usb-hcd.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/usb/usb-hcd.example.dt.yaml

Rob, any idea why has the bot got mad at me?

-Sergey

> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
