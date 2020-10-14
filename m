Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49603C433E7
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 13:28:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE9222201
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 13:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XuPno+Sw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE9222201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pxSFMsj7Uqj8FnL9AwcxqXteCTKgmvWU9e3J8OlzDgE=; b=XuPno+SwmyC573WMQ9ig3yXNl
	VTmtg42Y8sKPjIsc1JCYWa0kVJM9c8/gqS+a7t/E+4NBPGyQcpn2yxj3/j/XNvzKtw69uv9BUow6l
	T6+sMMDwspD6VI+UdHG51GTzQDEXchYKLSNFcCixNL35ylGM+fpAO94aNzdHxOSkm8x3kxSe0kuCZ
	FRPwR/Vg5h+99VClzvDSS7EvrTNl9TK66qxsxsG7MDbtYnXL45HRNZOu0/GghEzRsC+NumKmiIuOg
	SUX44zz805IDsTElgXbz0LZjbF6VKgl6hW7NqqvHzVL2XqM7xvkbeF0Mu7O3aKdrcA1izhiQuSk8G
	5qD6MBi7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSgp3-0004BQ-5w; Wed, 14 Oct 2020 13:28:06 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSgoy-00049e-6U; Wed, 14 Oct 2020 13:28:01 +0000
Received: by mail-ot1-f66.google.com with SMTP id m22so3415729ots.4;
 Wed, 14 Oct 2020 06:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZL5zSCW4abwqO0FHpIH/hdReN6zUDlAhI8F0pVQ1+U0=;
 b=Q1RANTN2Ebc9QXEUstoJYCBpiRfWD/jMRneuRb5cmyds9Jr17xYJNMvvcK9bN/QaQl
 /xShvM5mF00cOpKg0Yv4uiGXQ811HXCh5qsZ0rBteDpLCDxb1J5QyFCyrwEgOWWysqFJ
 EZy+X7ONd/QP8NgY3GfwOn7nq2n/4r5y78uY/GvFLLqohDk3CpcYyFD9LyMwoPBV29Aj
 oxIjL1uXS61/+n+ZtJt3ZvDnMbND0EYppIzVW3CvDjfqopauSB9kjl0GwTpgjvTWxMjT
 UEMppOfOSc+aZ1kewNvwqYc2elAvf7F2mQbJractv+pqEJh+zmm1VMPtP3oifZTQmON8
 a0DA==
X-Gm-Message-State: AOAM530nsPYl5UdC2GJ1fbu2YskbDEQt+ertl3+958ReRdXqJMR7rr3N
 53hWK4b05Uam8BNCgxOxgQ==
X-Google-Smtp-Source: ABdhPJx7vWvJU+mgKZyS7+CbeUNCduplAaoDS6csoJj2fWAGBxKcFikhthRG5g2vB1JTOE0K/Kpwlg==
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr1500221oth.1.1602682078846;
 Wed, 14 Oct 2020 06:27:58 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h25sm1165503otj.41.2020.10.14.06.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 06:27:58 -0700 (PDT)
Received: (nullmailer pid 1539238 invoked by uid 1000);
 Wed, 14 Oct 2020 13:27:56 -0000
Date: Wed, 14 Oct 2020 08:27:56 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 04/20] dt-bindings: usb: usb-hcd: Add "tpl-support"
 property
Message-ID: <20201014132756.GA1538723@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_092800_255162_014E834A 
X-CRM114-Status: GOOD (  14.08  )
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

On Wed, 14 Oct 2020 13:13:46 +0300, Serge Semin wrote:
> The host controller device might be designed to work for the particular
> products or applications. In that case its DT node is supposed to be
> equipped with the tpl-support property.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/it'/its"
> - Discard '|' from the property description, since we don't need to preserve
>   the text formatting.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 27, column 14
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/usb-hcd.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/usb-hcd.example.dts'
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/usb/usb-hcd.yaml:27:14: [error] syntax error: mapping values are not allowed here (syntax)
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1382001

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
