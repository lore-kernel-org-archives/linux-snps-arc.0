Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855F4C5475B
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Mar 2024 08:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAz0LuoJ7TNJEDLK0GwHR72DlTOKAtv/d7MrDRQV0V0=; b=XVlnDq2sA0sYeQ
	Mhzx9lTwKmtmY5zBtaJytNIq7jKFpwM3aV08wP3q84rdk1qvfgVTUqaAHE9yuk7gPKGjNBNUPHuwS
	6PPr/qLdZ+nGDxxt0Y578OGMowSjPFRuogXThQMU3vvmEe0/0xlNQgeWZqR91hiyZDue+WhNX//Jo
	Q1j3Z1lgK/texgSeHrleTyKxdsDYv5Bac/ERlTGNKOUp+cN40CxGVpRivX5H5RfyTsCh/9wiDzWJW
	810JBroOQettKj8Evo0L1Iyb2SAcBA9v/BpHHp5H6iP2EAOZvi9kyQOhpC2KjPedAyA7r+YAC1wnZ
	DnNKoiLwq/3g1Dav6AIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVE9-00000008Ffb-0Oyv;
	Fri, 08 Mar 2024 08:05:13 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVE6-00000008Fdw-2z4W
	for linux-snps-arc@lists.infradead.org;
	Fri, 08 Mar 2024 08:05:12 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-568241f40e9so619553a12.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 08 Mar 2024 00:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709885108; x=1710489908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+EpUbPTbuqIC7zhR4Qv+Znm2S5fARDet/7aWtGWTno=;
        b=p7cOPjnmM4PkXn/WokSL2zP1TndVuxkh3R5GW6iUnv0TU82oVX9F93nXzg9DE2wC6Q
         2kvjm+V/zxf3E+xMQ+t0nVRjw0zbUx0S8szno14jhJRwDWviOt0so843KficaoEdK5+a
         IgWrmwy12UFFno9Y4wQFOUcUkVg7It2vbMm6heOEjWh/qYRh0EYeS7BZcV09Bc8hr/0I
         BOIbL0NjqQDp7+Q7X/hcql1WOcIOMftCgKbRddz+Pyahy5OYFEEq2yGaMlMyGYyXqd10
         Jun2zg57kHj70r+7SoERiQcTSYxac+bnvjgKn6fWwoQ3soOuDRbh0T2N6c6iwy6SFtBn
         yAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709885108; x=1710489908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+EpUbPTbuqIC7zhR4Qv+Znm2S5fARDet/7aWtGWTno=;
        b=u5z8GktGxbZJTmevq/5kjSX0KGNdqWaoGzEVhkdwoIH5wZuPh6OUwyhOUwKdPf171P
         mdNz+E4y/jLp6ksaMMN3b7EoELN++fG8TAAjYcgIE7aXI8SxpnlTGqHh9w2Y3bjvYMkC
         2aOMPKs7TOHsyxBo4oPXFXhvjx5eZP+rmwc4ovJXvTdvKOJMRhzj4KJtz9uRkqnGajZq
         4WLMQhy5RMrbY2jtbMgGjmuf9dsOgPn9fwQXuSBhv77sDjFGVHO1jQE0uO+cwNe+wKGk
         jmZJM2W++BnrzbMFwhxjJFCYxqo/ELCNcuV8DXpFicayeFYxi4e8VhgxZ9KxcZmwT0jE
         oPew==
X-Forwarded-Encrypted: i=1; AJvYcCXLCzEWJW+HAOprfPpwyHcKx3/yTU3B7ycrH/KHmAmiVwAeagXMTVEymn0gccfm1ttXI0EjhroeR19J9OOHFNVo1v9jtRUE7oywP1BiPUkpy2Zz
X-Gm-Message-State: AOJu0YwkOhXwcy+2kpd0JCIKFLuCpRuyrYQwP3gucfGCg1dmqTtpHdlT
	0eS1HNTrFGwUONNG3fhzwI6dWPWT9oeuKCDupkkMKRD147i2FDGYI/VnIZ4pGSBxQvx+1yGPt0V
	8
X-Google-Smtp-Source: AGHT+IHBevtBa1oMnTTvQj2GdVOnbsPwbUKQ8ZRKKvjbRMwuLEK6xfBPrUx3pU9Q3S44UejX3WcvEQ==
X-Received: by 2002:a50:d483:0:b0:567:1221:d486 with SMTP id s3-20020a50d483000000b005671221d486mr1482094edi.33.1709885108272;
        Fri, 08 Mar 2024 00:05:08 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id er15-20020a056402448f00b005681486cafesm1681659edb.0.2024.03.08.00.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 00:05:07 -0800 (PST)
Message-ID: <53987b65-32f8-433d-beac-007499f0b08b@linaro.org>
Date: Fri, 8 Mar 2024 09:05:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pct: Convert to dtschema
Content-Language: en-US
To: Dorine Tipo <dorine.a.tipo@gmail.com>, vgupta@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com
References: <20240308021842.1975-1-dorine.a.tipo@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240308021842.1975-1-dorine.a.tipo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_000510_836275_2DD5FF18 
X-CRM114-Status: GOOD (  15.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 08/03/2024 03:18, Dorine Tipo wrote:
> convert the PCT Arc Performance Counter bindings to DT schema

There is no conversion here!

> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  .../devicetree/bindings/arc/pct.yaml          | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arc/pct.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arc/pct.yaml b/Documentation/devicetree/bindings/arc/pct.yaml
> new file mode 100644
> index 000000000000..1f97a7c21b77
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arc/pct.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pct.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARC Performance Counters
> +
> +maintainers:
> +  - Vineet Gupta <vgupta@kernel.org>
> +  - Rob Herring <robh+dt@kernel.org>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

No, neither me nor Rob have anything to do with Arc. Please choose
someone from the ARC maintainers, if there is no specific device maintainer.

> +
> +description: |


> +  The ARC700 can be configured with a pipeline performance monitor for counting
> +  CPU and cache events like cache misses and hits. Like conventional PCT there
> +  are 100+ hardware conditions dynamically mapped to up to 32 counters
> +
> +properties:
> +  compatible:
> +    const: "snps,arc700-pct"

Drop quotes. I have doubts that you tested it.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false

This must be additionalProperties instead. See example schema.

> +
> +examples:
> +  - |
> +    pmu {
> +        compatible = "snps,arc700-pct";

NAK, test your patches.

> 

Best regards,
Krzysztof


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
